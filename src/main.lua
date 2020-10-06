function _init()
  player={
    x=128/2,
    y=120
  }
  score=0
  bullets={}
  enemies={}
  last_fire=0

  for i=13,78,13 do
    for j=13,78,13 do
      add(enemies, make_enemy(i,j))
    end
  end
end
  
function _update()
  if btn(0) then player.x-=1 end
  if btn(1) then player.x+=1 end
  if btn(2) then 
    fire_bullet() 
  end
  for b in all(bullets) do
    b:update()
  end
  for e in all(enemies) do
    e:update()
  end
end
  
function _draw()
  cls()
  print("score: "..score)
  spr(3,player.x,player.y)
  for b in all(bullets) do
    b:draw()
  end
  for e in all(enemies) do
    e:draw()
  end
  for b in all(bullets) do
    for e in all(enemies) do
    check_collision(b,e)
    end
  end
end

function fire_bullet()
  last_fire+=1
  if last_fire<20 then
    return
  end
  last_fire=0

  add(bullets,{
    x=player.x,
    y=player.y,
    draw=function(self)
      pset(self.x,self.y,7)
    end,
    update=function(self)
      self.y-=1
    
      if self.y<0 then
        del(bellets, self)
      end
    end
  })
end

function check_collision(b,e)
  --check to see if b is within
  --each corner of the e
  local ul={x=e.x,y=e.y}
  local ur={x=e.x+8,y=e.y}
  local ll={x=e.x,y=e.y+8}
  local lr={x=e.x+8,y=e.y+8}
  
  if b.x>=ul.x and b.y>=ul.y and
     b.x<=ur.x and b.y>=ur.y and
     b.x>=ll.x and b.y<=lr.y and
     b.x<=lr.x and b.y<=lr.y then
   del(enemies,e)
   del(bullets,b)
   score+=1
  end
 end