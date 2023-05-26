local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

-------------
-- BATTERY --
-------------

local battery = wibox.widget.textbox()

gears.timer {
  timeout   = 30,
  call_now  = true,
  autostart = true,
  callback  = function()
      awful.spawn.easy_async_with_shell("sb-battery", function (stdout)
        battery.text = stdout
      end)
  end
}

return battery
