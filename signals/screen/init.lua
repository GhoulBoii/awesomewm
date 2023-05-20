local awful = require'awful'
local widgets = require("bar")

local vars = require'config.vars'
screen.connect_signal('request::desktop_decoration', function(s)
   awful.tag(vars.tags, s, awful.layout.layouts[1])
   s.promptbox = widgets.create_promptbox()
   s.taglist   = widgets.create_taglist(s)
   s.tasklist  = widgets.create_tasklist(s)
   s.wibox     = widgets.create_wibox(s)
end)
