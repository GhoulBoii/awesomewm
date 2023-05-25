local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")

-------------
-- BATTERY --
-------------

local battery = wibox.widget {
  text = "🔋",
  buttons = {
    awful.button({}, 1,
    function ()
      awful.spawn.easy_async([[bash -c 'acpi']],
      function(stdout, _, _, _)
          naughty.destroy(notification)
          notification = naughty.notify{
              text =  stdout,
              title = "Battery status",
              position = top_right,
              timeout = 5,
              width = 200,
          }
      end)
    end)
  },
  widget = wibox.widget.textbox
}

-- gears.timer {
--   timeout   = 30,
--   call_now  = true,
--   autostart = true,
--   callback  = function()
--       awful.spawn.easy_async_with_shell("sb-battery", function (stdout)
--         _M.battery.text = stdout
--       end)
--   end
-- }

return battery
