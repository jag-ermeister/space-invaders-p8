function new_game_over()
  game_over = {
    init = game_over_init,
    update = game_over_update,
    draw = game_over_draw,
    display_time = 0
  }
  game_over.init()
  return game_over
end

function game_over_init()
end

function game_over_update(self)
  self.display_time += 1

  if self.display_time == 30 * 4 then
    scene = new_main_menu()
  end
end

function game_over_draw()
  cls()
  print("Game Over :(")
end
