local awful = require("awful")
local menubar = require("menubar")

local apps = require("conf.apps")
local mod = require("binds.mod")
local switcher = require("binds.switcher")

menubar.utils.terminal = apps.terminal

-- general awesome keys
awful.keyboard.append_global_keybindings{
   awful.key{
      modifiers   = {mod.super},
      key         = 'q',
      description = 'reload awesome',
      group       = 'awesome',
      on_press    = awesome.restart,
   },
   awful.key{
      modifiers   = {mod.super, mod.shift},
      key         = 'q',
      description = 'quit awesome',
      group       = 'awesome',
      on_press    = awesome.quit,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 't',
      description = 'open a terminal',
      group       = 'launcher',
      on_press    = function() awful.spawn(apps.terminal) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 's',
      description = 'show the menubar',
      group       = 'launcher',
      on_press    = function() menubar.show() end,
   },
}

-- focus related keybindings
awful.keyboard.append_global_keybindings{
   awful.key{
      modifiers   = {mod.super},
      key         = 'j',
      description = 'focus next by index',
      group       = 'client',
      on_press    = function() awful.client.focus.byidx(1) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'k',
      description = 'focus previous by index',
      group       = 'client',
      on_press    = function() awful.client.focus.byidx(-1) end,
   },
   awful.key{
      modifiers   = {mod.alt},
      key         = 'Tab',
      description = 'Window Switcher',
      group       = 'client',
      on_press    = function() switcher.switch( 1, "Mod1", "Alt_L", "Shift", "Tab") end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = ',',
      description = 'focus the next screen',
      group       = 'screer',
      on_press    = function () awful.screen.focus_relative(1) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = '.',
      description = 'focus the previous screen',
      group       = 'screen',
      on_press    = function () awful.screen.focus_relative(-1) end,
  },
}

-- layout related keybindings
awful.keyboard.append_global_keybindings{
   awful.key{
      modifiers   = {mod.super, mod.shift},
      key         = 'j',
      description = 'swap with next client by index',
      group       = 'client',
      on_press    = function() awful.client.swap.byidx(1) end,
   },
   awful.key{
      modifiers   = {mod.super, mod.shift},
      key         = 'k',
      description = 'swap with previous client by index',
      group       = 'client',
      on_press    = function() awful.client.swap.byidx(-1) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'l',
      description = 'increase master width factor',
      group       = 'layout',
      on_press    = function() awful.tag.incmwfact(0.05) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'h',
      description = 'decrease master width factor',
      group       = 'layout',
      on_press    = function() awful.tag.incmwfact(-0.05) end,
   },
   awful.key{
      modifiers   = {mod.super, mod.shift},
      key         = 'h',
      description = 'increase the number of master clients',
      group       = 'layout',
      on_press    = function() awful.tag.incnmaster(1, nil, true) end,
   },
   awful.key{
      modifiers   = {mod.super, mod.shift},
      key         = 'l',
      description = 'decrease the number of master clients',
      group       = 'layout',
      on_press    = function() awful.tag.incnmaster(-1, nil, true) end,
   },
   awful.key{
      modifiers   = {mod.super, mod.ctrl},
      key         = 'h',
      description = 'increase the number of columns',
      group       = 'layout',
      on_press    = function() awful.tag.incncol(1, nil, true) end,
   },
   awful.key{
      modifiers   = {mod.super, mod.ctrl},
      key         = 'l',
      description = 'decrease the number of columns',
      group       = 'layout',
      on_press    = function() awful.tag.incncol(-1, nil, true) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'e',
      description = 'tile layout',
      group       = 'layout',
      on_press    = function() awful.layout.set(awful.layout.suit.tile) end,
   },
   awful.key{
      modifiers   = {mod.super,mod.shift},
      key         = 'f',
      description = 'fullscreen layout',
      group       = 'layout',
      on_press    = function() awful.layout.set(awful.layout.suit.max.fullscreen) end,
   },
   awful.key{
      modifiers   = {mod.super},
      key         = 'm',
      description = 'max layout',
      group       = 'layout',
      on_press    = function() awful.layout.set(awful.layout.suit.max) end,
   },
}

awful.keyboard.append_global_keybindings{
   awful.key{
      modifiers   = {mod.super},
      keygroup    = 'numrow',
      description = 'only view tag',
      group       = 'tag',
      on_press    = function(index)
         local screen = awful.screen.focused()
         local tag = screen.tags[index]
         if tag then
            tag:view_only()
         end
      end
   },
   awful.key{
      modifiers   = {mod.super, mod.ctrl},
      keygroup    = 'numrow',
      description = 'toggle tag',
      group       = 'tag',
      on_press    = function(index)
         local screen = awful.screen.focused()
         local tag = screen.tags[index]
         if tag then
            awful.tag.viewtoggle(tag)
         end
      end
   },
   awful.key{
      modifiers   = {mod.super, mod.shift},
      keygroup    = 'numrow',
      description = 'move focused client to tag',
      group       = 'tag',
      on_press    = function(index)
         if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
               client.focus:move_to_tag(tag)
            end
         end
      end
   },
   awful.key {
      modifiers   = {mod.super, mod.ctrl, mod.shift},
      keygroup    = 'numrow',
      description = 'toggle focused client on tag',
      group       = 'tag',
      on_press    = function(index)
         if client.focus then
            local tag = client.focus.screen.tags[index]
            if tag then
               client.focus:toggle_tag(tag)
            end
         end
      end,
   },
}
