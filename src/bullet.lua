function fire_bullet()
  last_fire+=1
  if last_fire<20 then
    return
  end
  last_fire=0

  move=function(_y)
    printh("player bullet moving")
    return _y - 1
  end
  remove=function(_y)
    return _y <0
  end

  make_bullet(bullets, player.x, player.y, move, remove)
end
  
function enemy_fire_bullet(enemy)
  -- todo add offset to enemy x and y
  move=function(_y)
    printh("enemy bullet moving")
    return _y + 1
  end
  remove=function(_y)
    return _y > 128
  end

  printh("firing enemy bullet")
  make_bullet(enemy_bullets, enemy.x, enemy.y, move, remove)
--   add(enemy_bullets,{
--     x=enemy.x,
--     y=enemy.y,
--     draw=function(self)
--       pset(self.x,self.y,7)
--     end,
--     update=function(self)
--       self.y+=1
--       if self.y>128 then
--         del(enemy_bullets, self)
--       end
--     end
--   })
end

function make_bullet(bullet_list, _x, _y, move, limit)
  add(bullet_list,{
    x=_x,
    y=_y,
    draw=function(self)
      pset(self.x,self.y,7)
    end,
    update=function(self)
      self.y = move(self.y)
      if remove(self.y) then
        del(bullet_list, self)
      end
    end
  })
end