function make_enemy(_x,_y, _column)
  return {
    start_x=_x,
    x=_x,
    y=_y,
    column=_column,
    sprite=1,
    dx=1,
    range=40,
    last_update=0,
    update_rate=10,
    update=function(self)
      self.last_update+=1
      if self.last_update==self.update_rate then
        self.last_update=0  
        
        if self.x==(self.start_x+self.range) then
          self.dx=-1
        end
        if self.x==self.start_x then
          self.dx=1
        end
        self.x+=self.dx

        if self.sprite==1 then 
          self.sprite=2 
        elseif self.sprite==2 then 
          self.sprite=1 
        end
      end
    end,
    draw=function(self)
      spr(self.sprite,self.x,self.y)
    end
  }
end