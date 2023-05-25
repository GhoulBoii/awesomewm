local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

------------
-- VOLUME --
------------

local volume = wibox.widget {
    widget = wibox.widget.textbox
}

gears.timer {
  timeout   = 0.1,
  call_now  = true,
  autostart = true,
  callback  = function()
      awful.spawn.easy_async_with_shell("sb-volume", function (stdout)
        volume.text = stdout
      end)
  end
}

return volume
