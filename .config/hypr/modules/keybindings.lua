---------------------
---- KEYBINDINGS ----
---------------------

local programs = require("modules/programs")

local mainMod     = "SUPER" -- Sets "Windows" key as main modifier
local terminal    = programs.terminal
local fileManager = programs.fileManager
local menu        = programs.menu

-- Example binds, see https://wiki.hypr.land/configuring/core/binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
-- hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + CTRL + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Custom keybindings
hl.bind(mainMod .. " + X",
    hl.dsp.exec_cmd("~/.config/rofi/launchers/type-4/calc.sh"))
-- hl.bind(mainMod .. " + period",
    -- hl.dsp.exec_cmd("~/.config/rofi/launchers/type-4/emoji.sh"))
hl.bind(mainMod .. " + SHIFT + L",
    hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + O",
    hl.dsp.exec_cmd('grim -g "$(slurp)" - | tesseract -l eng - - | wl-copy'))
-- hl.bind(mainMod .. " + SHIFT + C",
--     hl.dsp.exec_cmd('grim -g "2592,319 1916x953" - | tesseract - - | wl-copy'))
hl.bind("Print",
    hl.dsp.exec_cmd("grim ~/Pictures/Screenshots/I_AM_NEW_SCREENSHOT__FULL.png"))
hl.bind("SHIFT + Print",
    hl.dsp.exec_cmd('grim -g "$(slurp)" ~/Pictures/Screenshots/I_AM_NEW_SCREENSHOT.png'))
hl.bind("CTRL + Print",
    hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- toggle waybar
local waybar_toggle = false
hl.bind(mainMod .. " + SHIFT + B",function()
    if waybar_toggle then
        hl.dispatch(hl.dsp.exec_cmd('killall waybar'))
        waybar_toggle = false
    else
        hl.dispatch(hl.dsp.exec_cmd('waybar'))
        waybar_toggle = true
    end
end)

-- toggle hyprsunset
local hyprsunset_toggle = true
hl.bind(mainMod .. " + SHIFT + Y",function()
    if hyprsunset_toggle then
        hl.dispatch(hl.dsp.exec_cmd('killall hyprsunset'))
       hyprsunset_toggle = false
    else
        hl.dispatch(hl.dsp.exec_cmd('hyprsunset'))
       hyprsunset_toggle = true
    end
end)

hl.bind(mainMod .. " + W",
  hl.dsp.exec_cmd('kitty -e hyprmon'))

hl.bind(mainMod .. " + Z",
  hl.dsp.exec_cmd('kitty -e bluetuith'))

hl.bind(mainMod .. " + N",
  hl.dsp.exec_cmd('kitty -e nmtui'))

hl.bind(mainMod .. " + D",
    hl.dsp.exec_cmd('kitty -e sudo systemctl-tui'))
-- hl.bind(mainMod .. " + SHIFT + B",
--    hl.dsp.exec_cmd('waybar'))
-- hl.bind(mainMod .. " + SHIFT + F",
--    hl.dsp.exec_cmd('killall waybar'))

-- hl.bind("SUPER + TAB", function()
--    hl.plugin.overview.toggle()
-- end, { description = "Toggle Hyprspace overview" })
-- hl.bind("SUPER + SHIFT + TAB", function()
--    hl.plugin.overview.toggle("all")
-- end, { description = "Toggle Hyprspace overview on all monitors" })
-- hl.bind(mainMod .. " + SHIFT + M",
--    hl.dsp.exec_cmd('kitty -e hyprmon'))

-- Scrolling
-- hl.bind("SUPER", "H", hl.dsp.layout("focus l"))
-- hl.bind("SUPER", "L", hl.dsp.layout("focus r"))
-- hl.bind("SUPER SHIFT", "H", hl.dsp.layout("swapcol l"))
-- hl.bind("SUPER SHIFT", "L", hl.dsp.layout("swapcol r"))

-- hl.bind("SUPER", "F", hl.dsp.layout("fit active"))
-- hl.bind("SUPER", "E", hl.dsp.layout("fit expand"))
-- hl.bind("SUPER", "P", hl.dsp.layout("promote"))
-- hl.bind("SUPER", "I", hl.dsp.layout("inhibit_scroll toggle"))

-- Key bindings for Scrolling
hl.bind(mainMod .. " + H", hl.dsp.layout("focus l"))
hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.layout("swapcol r"))
-- hl.bind(mainMod .. " + CTRL + J", hl.dsp.layout("consume_or_expel next"))
-- hl.bind(mainMod .. " + CTRL + K", hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + COMMA", hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + PERIOD", hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + EQUAL", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + MINUS", hl.dsp.layout("colresize -conf"))

-- hl.bind(mainMod .. " + D", hl.dsp.layout("fit visible"))
-- hl.bind(mainMod .. " + C", hl.dsp.layout("fit active"))
-- hl.bind(mainMod .. " + HOME", hl.dsp.layout("fit tobeg"))
-- hl.bind(mainMod .. " + END", hl.dsp.layout("fit toend"))
-- hl.bind(mainMod .. " + SHIFT + E", hl.dsp.layout("fit expand"))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.layout("expel"))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.layout("consume"))
-- hl.bind(mainMod .. " + SHIFT + D", hl.dsp.layout("inhibit_scroll"))
-- hl.bind(mainMod .. " + TAB", function()
--     hl.plugin.scrolloverview.overview("toggle all")
-- end)
