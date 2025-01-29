local _M = {}

local awful = require("awful")

_M.layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.max,
   awful.layout.suit.max.fullscreen,
   awful.layout.suit.floating,
}
--   󰈹 
_M.tags = { "", "", "", "" }

return _M
