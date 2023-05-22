local awful = require'awful'

local vars = require("conf.vars")

tag.connect_signal('request::default_layouts', function()
   awful.layout.append_default_layouts(vars.layouts)
end)

tag.connect_signal("property::urgent", function(t)
  t:view_only()
end)
