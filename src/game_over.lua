function new_game_over(_score, _reason)
  game_over = {
    init = game_over_init,
    update = game_over_update,
    draw = game_over_draw,
    score = _score,
    reason = _reason
  }
  game_over.init()
  return game_over
end

function game_over_init()
end

function game_over_update(self)
  if btnp(2) then
    scene = new_main_menu()
  end
end

function game_over_draw(self)
  cls()
  print("Score: "..self.score)
  print("")
  printh("reason is")
  printh(self.reason)
  if self.reason == "dead" then
    print("You died.")
  elseif self.reason == "breached" then
    print("The defenses of the resistance")
    print("have been breached!")
  end

  print("")
  print("Game Over :(")
  print("")
  print("")
  print("<<Press Up to continue >>")
end
