-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

--  Load Theme
require("beautiful").init("~/.config/awesome/theme/init.lua")

-- Load Bindings
require("binds")

-- Load Rules
require("rules")

-- Load Signals
require("sig")
