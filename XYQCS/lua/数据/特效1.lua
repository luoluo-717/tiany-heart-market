local 特效 = class("特效")
function 特效:初始化(t)
  self.xy = require("GGE.坐标")(t.x * 20, t.y * 20):floor()
  self.精灵 = __res["取动画"](__res, __res["取地址"](__res, "shape/mapani/", t["切换"]))["取动画"](__res["取动画"](__res, __res["取地址"](__res, "shape/mapani/", t["切换"])), 1)["播放"](__res["取动画"](__res, __res["取地址"](__res, "shape/mapani/", t["切换"]))["取动画"](__res["取动画"](__res, __res["取地址"](__res, "shape/mapani/", t["切换"])), 1), true)
  self.pid = t.pid
  self.id = t.id
end
function 特效:更新(dt)
  if self.精灵 then
    self.精灵["更新"](self.精灵, dt)
  end
end
function 特效:显示(pys)
  if self.精灵 then
    self.精灵["显示"](self.精灵, self.xy + pys)
  end
end
return 特效
