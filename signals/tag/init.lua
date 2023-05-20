local awful = require'awful'

local vars = require'config.vars'

tag.connect_signal('request::default_layouts', function()
   awful.layout.append_default_layouts(vars.layouts)
end)

tag.connect_signal("property::urgent", function(t)
  t:view_only()
end)
