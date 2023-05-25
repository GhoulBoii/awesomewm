local _M = {}

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local widgets = require("bar.widgets")

_M.separator = wibox.widget {
  wibox.widget.textbox("|"),
  fg = beautiful.fg_normal,
  widget = wibox.container.background
}

function _M.create_promptbox() return awful.widget.prompt() end

function _M.create_taglist(s)
   return awful.widget.taglist{
      screen = s,
      filter  = awful.widget.taglist.filter.noempty,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function(t) t:view_only() end,
         },
         awful.button{
            modifiers = {},
            button    = 3,
            on_press  = awful.tag.viewtoggle,
         },
      }
   }
end

function _M.create_tasklist(s)
   return awful.widget.tasklist{
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = {
         awful.button{
            modifiers = {},
            button    = 1,
            on_press  = function(c)
               c:activate{context = 'tasklist', action = 'toggle_minimization'}
            end,
         },
      }
   }
end

function _M.create_wibox(s)
   return awful.wibar{
      screen = s,
      position = 'top',
      height = 20,
      margins = {
        top = 10,
        left = 20,
        right = 20,
      },

      widget = {
         layout = wibox.layout.align.horizontal,
         -- left widgets
         {
            layout = wibox.layout.fixed.horizontal,
            s.taglist,
            s.promptbox,
         },
         -- middle widgets
         s.tasklist,
         -- right widgets
         {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(10),
            widgets.volume,
            _M.separator,
            widgets.battery,
            _M.separator,
            widgets.clock,
            wibox.widget.systray({
              screen = 0,
            }),
         }
      }
   }
end

return _M
