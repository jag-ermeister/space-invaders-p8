function new_main_menu()
  main_menu = {
    init = main_menu_init,
    update = main_menu_update,
    draw = main_menu_draw
  }
  main_menu.init()
  return main_menu
end

function main_menu_init()
  print_screen = screen_1
end

function main_menu_update()
  if btnp(2) and print_screen == screen_1 then
    print_screen = screen_2
  elseif btnp(2) and print_screen == screen_2 then
    print_screen = screen_3
  elseif btnp(2) and print_screen == screen_3 then
    scene = new_game()
  end
end

function main_menu_draw()
  cls()
  print_screen()
end

function screen_1()
  print("October, 2020 A.D.")
  print("")
  print("In an effort to control the ")
  print("outbreak, President Trump")
  print("summons extraterrestrial")
  print("assistance to eradicate the ")
  print("virus.")
  print("")
  print("<<Press Up to continue >>")
end

function screen_2()
  print("October, 2020 A.D.")
  print("")
  print("The President has declared the ")
  print("virus epicenters to be blue")
  print("states such as California and")
  print("Colorado.")
  print("")
  print("These states will be targeted")
  print("first, followed by the swing")
  print("states.")
  print("")
  print("<<Press Up to continue >>")
end

function screen_3()
  print("October, 2020 A.D.")
  print("")
  print("Unblinded by partison rhetoric,")
  print("a small group of patriots has")
  print("formed a resistance movement.")
  print("")
  print("You've been enlisted to lead")
  print("the charge.")
  print("")
  print("Can you save your country?")
  print("")
  print("Keep the defenses of the")
  print("resistance from being")
  print("breached!")
  print("")
  print("<<Press Up to continue >>")
end