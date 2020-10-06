function _init()
  player={
    x=128/2,
    y=120
  }
  score=0
  bullets={}
  enemy_bullets={}
  enemies={}
  last_fire=0
  enemy_columns={}

  local column=0
  for i=13,78,13 do
    enemy_columns[column]={}
    for j=13,78,13 do
      local enemy=make_enemy(i,j)
      add(enemies, enemy)
      add(enemy_columns[column], enemy)
    end
    column+=1
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
  for eb in all(enemy_bullets) do
    eb:update()
  end
  for e in all(enemies) do
    e:update()
  end

  for column in all(enemy_columns) do
    local num=flr(rnd(100))
    if num==20 then -- 1 in 100 chance per frame
      enemy_fire_bullet(last(column))
    end
  end
end
  
function _draw()
  cls()
  print("score: "..score)
  spr(3,player.x,player.y)
  for b in all(bullets) do
    b:draw()
  end
  for eb in all(enemy_bullets) do
    eb:draw()
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

 --TODO
 --delete enemies from column structure on death
 --better OOP