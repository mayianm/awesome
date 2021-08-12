--      ██████╗  █████╗ ███╗   ██╗███████╗██╗     ███████╗
--      ██╔══██╗██╔══██╗████╗  ██║██╔════╝██║     ██╔════╝
--      ██████╔╝███████║██╔██╗ ██║█████╗  ██║     ███████╗
--      ██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║     ╚════██║
--      ██║     ██║  ██║██║ ╚████║███████╗███████╗███████║
--      ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚══════╝

-- ===================================================================
-- Imports
-- ===================================================================


local awful = require('awful')
local top_panel = require('components.panels.top-panel')
local top_panel_min = require('components.panels.top-panel-minimal')
local left_panel = require('components.panels.left-panel')


-- ===================================================================
-- Initialization & Functionality
-- ===================================================================


-- Create a wibox for each screen and add it
screen.connect_signal("request::desktop_decoration", function(s)
  if s == 2 then
     s.top_panel_min = top_panel_min(s)
  else
     s.top_panel = top_panel(s)
  end
end)

-- Hide bars when app go fullscreen
function updateBarsVisibility()
  for s in screen do
    if s.selected_tag then
      local fullscreen = s.selected_tag.fullscreenMode
      -- make top / left bar invisible if fullscreen
      if s == 2 then
         s.top_panel_min.visible = not fullscreen
      else
         s.top_panel.visible = not fullscreen
      end
    end
  end
end

tag.connect_signal(
  'property::selected',
  function(t)
    updateBarsVisibility()
  end
)

client.connect_signal(
  'property::fullscreen',
  function(c)
    if c.first_tag then
      c.first_tag.fullscreenMode = c.fullscreen
    end
    updateBarsVisibility()
  end
)

client.connect_signal(
  'unmanage',
  function(c)
    if c.fullscreen then
      c.screen.selected_tag.fullscreenMode = false
      updateBarsVisibility()
    end
  end
)
