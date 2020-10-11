function fire_bullet()
  last_fire+=1
  if last_fire<20 then
    return
  end
  last_fire=0

  add(bullets,{
    x=player.x,
    y=player.y,
    update_rate = 2,
    last_update = 0,
    draw=function(self)
      pset(self.x,self.y,7)
    end,
    update=function(self)
      self.last_update += 1
      if self.last_update < self.update_rate then
        return
      end
      self.last_update = 0

      self.y-=1
      if self.y<0 then
        del(bullets, self)
      end
    end
  })
end
  
function enemy_fire_bullet(enemy)
  add(enemy_bullets,{
    x=enemy.x,
    y=enemy.y+8,
    update_rate = 2,
    last_update = 0,
    draw=function(self)
      pset(self.x,self.y,7)
    end,
    update=function(self)
      self.last_update += 1
      if self.last_update < self.update_rate then
        return
      end
      self.last_update = 0

      self.y+=1
      if self.y>128 then
        del(enemy_bullets, self)
      end
    end
  })
end
