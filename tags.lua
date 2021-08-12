--      ████████╗ █████╗  ██████╗ ███████╗
--      ╚══██╔══╝██╔══██╗██╔════╝ ██╔════╝
--         ██║   ███████║██║  ███╗███████╗
--         ██║   ██╔══██║██║   ██║╚════██║
--         ██║   ██║  ██║╚██████╔╝███████║
--         ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚══════╝

-- ===================================================================
-- Imports
-- ===================================================================


local dir = os.getenv('HOME') .. '/.config/awesome/icons/tags/'
local apps = require("apps")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")


-- ===================================================================
-- Define tags
-- ===================================================================


local tags = {
  {
    icon = dir .. 'pip1.png',
    type = 'terminal',
    defaultApp = apps.terminal,
    screen = 1
  },
  {
    icon = dir .. 'pip2.png',
    type = 'chrome',
    defaultApp = apps.browser,
    screen = 1
  },
  {
    icon = dir .. 'pip3.png',
    type = 'code',
    defaultApp = apps.editor,
    screen = 1
  },
  {
    icon = dir .. 'pip4.png',
    type = 'files',
    defaultApp = apps.filebrowser,
    screen = 1
  },
  {
    icon = dir .. 'pip5.png',
    type = 'music',
    defaultApp = apps.virtualMachineLauncher,
    screen = 1
  }
  -- {
  --   icon = dir .. 'pip6.png',
  --   type = 'game',
  --   defaultApp = apps.gameLauncher,
  --   screen = 1
  -- },
  -- {
  --   icon = dir .. 'pip7.png',
  --   type = 'art',
  --   defaultApp = apps.imageEditor,
  --   screen = 1
  -- },
  -- {
  --   icon = dir .. 'pip8.png',
  --   type = 'virtualbox',
  --   defaultApp = apps.virtualMachineLauncher,
  --   screen = 1
  -- },
  -- {
  --   icon = dir .. 'pip9.png',
  --   type = 'any',
  --   defaultApp = apps.musicPlayer,
  --   screen = 1
  -- }
}


-- ===================================================================
-- Additional Setup
-- ===================================================================


-- define tag layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.floating,
    awful.layout.suit.max,
    awful.layout.suit.tile.top,
}

-- apply tag settings to each tag
screen.connect_signal("request::desktop_decoration", function(s)
  for i, tag in pairs(tags) do
    awful.tag.add(i, {
      icon = tag.icon,
      icon_only = true,
      layout = awful.layout.suit.tile,
      screen = s,
      defaultApp = tag.defaultApp,
      selected = i == 1
    })
  end
end)

-- remove gaps if layout is set to max
tag.connect_signal('property::layout', function(t)
  local currentLayout = awful.tag.getproperty(t, 'layout')
  if (currentLayout == awful.layout.suit.max) then
    t.gap = 0
  else
    t.gap = beautiful.useless_gap
  end
end)
