local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

-----------
-- CLOCK --
-----------

local clock = wibox.widget.textbox()

gears.timer {
  timeout   = 1,
  call_now  = true,
  autostart = true,
  callback  = function()
      awful.spawn.easy_async_with_shell("sb-clock", function (stdout)
        clock.text = stdout
      end)
  end
}

return clock
