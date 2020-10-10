function new_game()
  game = {
    init = game_init,
    update = game_update,
    draw = game_draw
  }
  game.init()
  return game
end

function game_init()
  printh("debugging")
  local list = {}
  --list[0]=0
  --list[1]=1
  -- list[2]=2
  -- list[3]=3
  -- list[4]=4
  -- list[5]="poop"
  -- list[6]="poop"
  -- list[7]="poop"
  -- list[5]="poop"
  -- list[9]="crap"
  -- printh(#list)

  printh("end debugging")

  player = new_player()
  score = 0
  lives = 3
  bullets = {}
  enemy_bullets = {}
  enemies = {}
  last_fire = 0
  difficulty = 0
  enemy_columns = {}

  local column = 1
  for i = 13, 78, 13 do
    enemy_columns[column] = {}
    for j = 13, 78, 13 do
      local enemy = make_enemy(i, j, column)
      add(enemies, enemy)
      add(enemy_columns[column], enemy)
    end
    column += 1
  end 
end

function game_update()
  detect_game_over()

  player:update()

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

  local column_num = 0
  for column in all(enemy_columns) do
    if not is_empty(column) then
      local num = flr(rnd(100))
      if num == 20 then -- 1 in 100 chance per frame
        enemy_fire_bullet(last(column))
      end
    end
    column_num += 1
  end
end

function detect_game_over()
  if lives == 0 then
    scene = new_game_over(score, "dead")
  end

  for e in all(enemies) do
    if e.y > 115 then
      scene = new_game_over(score, "breached")
      break -- TODO this does not work
    end
  end
end

function game_draw()
  cls()
  display_stats()
  spr(3, player.x, player.y)
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
    check_collision(b, e)
    end
  end
  for h in all(enemy_bullets) do
    check_player_collision(h, player)
  end
end

function display_stats()
  local num_spaces = 15
  if score > 9 then num_spaces -=1 end
  
  local spaces = ""
  for i = 1, num_spaces do
    spaces = spaces.." "
  end

  print("score: "..score..spaces.."lives: "..lives)
end


function check_player_collision(b, p)
  local ul={x=p.x, y=p.y}
  local ur={x=p.x+8, y=p.y}
  local ll={x=p.x, y=p.y+8}
  local lr={x=p.x+8, y=p.y+8}

  if b.x>=ul.x and b.y>=ul.y and
     b.x<=ur.x and b.y>=ur.y and
     b.x>=ll.x and b.y<=lr.y and
     b.x<=lr.x and b.y<=lr.y then
    -- TODO reset player position
    del(enemy_bullets,b)

    lives -= 1
    detect_game_over()
  end
end

function check_collision(b, e)
  --check to see if b is within
  --each corner of the e
  local ul={x=e.x, y=e.y}
  local ur={x=e.x+8, y=e.y}
  local ll={x=e.x, y=e.y+8}
  local lr={x=e.x+8, y=e.y+8}
  
  if b.x>=ul.x and b.y>=ul.y and
     b.x<=ur.x and b.y>=ur.y and
     b.x>=ll.x and b.y<=lr.y and
     b.x<=lr.x and b.y<=lr.y then

    del(enemies,e)
    del(bullets,b)
    del(enemy_columns[e.column], e)

    increase_difficulty()

    score += 1
  end
end

function increase_difficulty()
  -- I think I need to try update60 again
  -- if difficulty % 4 == 0 then
  --   difficulty += 1
  --   printh("incrrease frequency")
  --   for e in all(enemies) do
  --     e:increase_update()
  --   end
  -- else
  --   difficulty += 1
  --   printh("incrase travel")
  --   for e in all(enemies) do
  --     e:increase_travel()
  --   end
  -- end
end