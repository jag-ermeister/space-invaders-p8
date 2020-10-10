function make_enemy(_x,_y, _column)
  return {
    start_x = _x,
    x = _x + 1, -- start 1 pixel to the right so we don't immediately move down
    y = _y,
    column = _column,
    sprite = 1,
    dx = 1,
    dy = 3,
    range = 40,
    last_update = 0,
    update_rate = 10,
    update = function(self)
      self.last_update += 1
      if self.last_update >= self.update_rate then
        self.last_update = 0
        
        if self.x >= (self.start_x + self.range) then
          self:change_direction()
          self.y += self.dy
        end
        if self.x <= self.start_x then
          self:change_direction()
          self.y += self.dy
        end
        self.x += self.dx

        if self.sprite == 1 then
          self.sprite = 2
        elseif self.sprite == 2 then
          self.sprite = 1
        end
      end    
    end,
    draw = function(self)
      spr(self.sprite, self.x, self.y)
    end,
    increase_update = function(self)
      self.update_rate -= 1
    end,
    increase_travel = function(self)
      if self.dx > 0 then
        self.dx += 1
      else
        self.dx -= 1
      end
    end,
    change_direction = function(self)
      self.dx *= -1
    end
  }
end