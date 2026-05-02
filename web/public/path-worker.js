let grid = null;

const COLLISION_SAMPLES = [
  { x: 0, y: 0 },
  { x: -7, y: 0 },
  { x: 7, y: 0 },
  { x: 0, y: -5 },
  { x: 0, y: 5 },
];

const PATH_MAX_VISITED = 45000;

function isWalkablePoint(x, y) {
  if (!grid || x < 0 || y < 0 || x > grid.width * grid.cellSize || y > grid.height * grid.cellSize) return false;
  for (const sample of COLLISION_SAMPLES) {
    const cx = Math.floor((x + sample.x) / grid.cellSize);
    const cy = Math.floor((y + sample.y) / grid.cellSize);
    if (cx < 0 || cy < 0 || cx >= grid.width || cy >= grid.height) return false;
    if (grid.bytes[cy * grid.width + cx] === grid.blockedValue) return false;
  }
  return true;
}

function pointToCell(point) {
  return {
    x: Math.max(0, Math.min(grid.width - 1, Math.floor(point.x / grid.cellSize))),
    y: Math.max(0, Math.min(grid.height - 1, Math.floor(point.y / grid.cellSize))),
  };
}

function cellCenter(cell) {
  return { x: (cell.x + 0.5) * grid.cellSize, y: (cell.y + 0.5) * grid.cellSize };
}

function heapPush(heap, item) {
  heap.push(item);
  let index = heap.length - 1;
  while (index > 0) {
    const parent = (index - 1) >> 1;
    if (heap[parent].score <= item.score) break;
    heap[index] = heap[parent];
    index = parent;
  }
  heap[index] = item;
}

function heapPop(heap) {
  const first = heap[0];
  const last = heap.pop();
  if (heap.length && last) {
    let index = 0;
    while (true) {
      const left = index * 2 + 1;
      const right = left + 1;
      if (left >= heap.length) break;
      const child = right < heap.length && heap[right].score < heap[left].score ? right : left;
      if (heap[child].score >= last.score) break;
      heap[index] = heap[child];
      index = child;
    }
    heap[index] = last;
  }
  return first;
}

function hasWalkableLine(from, to) {
  const distance = Math.hypot(to.x - from.x, to.y - from.y);
  const steps = Math.max(1, Math.ceil(distance / 10));
  for (let index = 1; index <= steps; index += 1) {
    const t = index / steps;
    const x = from.x + (to.x - from.x) * t;
    const y = from.y + (to.y - from.y) * t;
    if (!isWalkablePoint(x, y)) return false;
  }
  return true;
}

function smoothPath(points) {
  if (points.length <= 2) return points;
  const smoothed = [points[0]];
  let anchor = 0;
  while (anchor < points.length - 1) {
    let next = points.length - 1;
    while (next > anchor + 1 && !hasWalkableLine(points[anchor], points[next])) next -= 1;
    smoothed.push(points[next]);
    anchor = next;
  }
  return smoothed;
}

function findWalkPath(origin, target) {
  if (!grid) return null;
  if (hasWalkableLine(origin, target)) return [target];

  const start = pointToCell(origin);
  const goal = pointToCell(target);
  if (start.x === goal.x && start.y === goal.y) return [target];

  const total = grid.width * grid.height;
  const startIndex = start.y * grid.width + start.x;
  const goalIndex = goal.y * grid.width + goal.x;
  const gScore = new Float64Array(total);
  const cameFrom = new Int32Array(total);
  const closed = new Uint8Array(total);
  const walkable = new Int8Array(total);
  gScore.fill(Infinity);
  cameFrom.fill(-1);

  function canUseCell(x, y) {
    if (x < 0 || y < 0 || x >= grid.width || y >= grid.height) return false;
    const index = y * grid.width + x;
    if (!walkable[index]) {
      walkable[index] = isWalkablePoint((x + 0.5) * grid.cellSize, (y + 0.5) * grid.cellSize) ? 1 : -1;
    }
    return walkable[index] === 1;
  }

  function estimate(x, y) {
    const dx = Math.abs(goal.x - x);
    const dy = Math.abs(goal.y - y);
    return Math.max(dx, dy) + (Math.SQRT2 - 1) * Math.min(dx, dy);
  }

  if (!canUseCell(start.x, start.y) || !canUseCell(goal.x, goal.y)) return null;

  const open = [];
  gScore[startIndex] = 0;
  heapPush(open, { x: start.x, y: start.y, index: startIndex, score: estimate(start.x, start.y) });

  const directions = [
    [1, 0, 1],
    [-1, 0, 1],
    [0, 1, 1],
    [0, -1, 1],
    [1, 1, Math.SQRT2],
    [-1, 1, Math.SQRT2],
    [1, -1, Math.SQRT2],
    [-1, -1, Math.SQRT2],
  ];
  let found = -1;
  let visited = 0;

  while (open.length && visited < PATH_MAX_VISITED) {
    const current = heapPop(open);
    if (!current || closed[current.index]) continue;
    closed[current.index] = 1;
    visited += 1;
    if (current.index === goalIndex) {
      found = current.index;
      break;
    }

    for (const [dx, dy, cost] of directions) {
      const x = current.x + dx;
      const y = current.y + dy;
      if (!canUseCell(x, y)) continue;
      if (dx && dy && (!canUseCell(current.x + dx, current.y) || !canUseCell(current.x, current.y + dy))) continue;
      const index = y * grid.width + x;
      if (closed[index]) continue;
      const nextScore = gScore[current.index] + cost;
      if (nextScore >= gScore[index]) continue;
      cameFrom[index] = current.index;
      gScore[index] = nextScore;
      heapPush(open, { x, y, index, score: nextScore + estimate(x, y) });
    }
  }

  if (found < 0) return null;
  const cells = [];
  for (let index = found; index >= 0; index = cameFrom[index]) {
    cells.push({ x: index % grid.width, y: Math.floor(index / grid.width) });
    if (index === startIndex) break;
  }
  cells.reverse();
  const points = cells.map(cellCenter);
  points[0] = { x: origin.x, y: origin.y };
  points[points.length - 1] = { x: target.x, y: target.y };
  return smoothPath(points).slice(1);
}

self.onmessage = (event) => {
  const message = event.data || {};
  if (message.type === "init") {
    const collision = message.collision || {};
    grid = {
      width: Number(collision.width || 0),
      height: Number(collision.height || 0),
      cellSize: Number(collision.cellSize || 20),
      blockedValue: Number(collision.blockedValue ?? 1),
      bytes: new Uint8Array(collision.bytes || 0),
    };
    return;
  }

  if (message.type === "path") {
    const path = findWalkPath(message.origin, message.target);
    self.postMessage({ type: "path", commandId: message.commandId, target: message.target, path: path || [] });
  }
};
