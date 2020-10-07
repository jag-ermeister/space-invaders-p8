function new_player()
  return {
    x = 128/2,
    y = 120,
    update = function(self)
      if btn(0) and self.x > 0 then
        self.x -= 1
      end
      if btn(1) and self.x < (128 - 8) then
        self.x += 1
      end
    end
  }
end
