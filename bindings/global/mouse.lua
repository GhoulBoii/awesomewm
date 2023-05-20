local awful = require'awful'

awful.mouse.append_global_mousebindings{
   awful.button{
      modifiers = {},
      button    = 4,
      on_press  = awful.tag.viewprev
   },
   awful.button{
      modifiers = {},
      button    = 5,
      on_press  = awful.tag.viewnext
   },
}
