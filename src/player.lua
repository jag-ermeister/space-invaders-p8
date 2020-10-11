function new_player()
  return {
    x = 128/2,
    y = 120,
    update_rate = 2,
    last_update = 0,
    update = function(self)
      self.last_update += 1
      if self.last_update < self.update_rate then
        return
      end
      self.last_update = 0

      if btn(0) and self.x > 0 then
        self.x -= 1
      end
      if btn(1) and self.x < (128 - 8) then
        self.x += 1
      end
    end
  }
end
