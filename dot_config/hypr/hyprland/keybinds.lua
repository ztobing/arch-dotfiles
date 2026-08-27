local mainMod = "SUPER"
local hyper = "SUPER + CTRL + ALT + SHIFT"

-- WM
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(TERMINAL))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(MENU))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) 
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))       -- Lua executes background commands automatically
hl.bind("ALT + TAB", hl.dsp.exec_cmd("rofi -show window"))

-- Window Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "d" }))

-- Window Position
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces & Move windows to workspaces (0-9)
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
-- Handle workspace 10 mapped to '0'
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Relative Workspace Navigation
hl.bind(hyper .. " + A", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(hyper .. " + S", hl.dsp.focus({ workspace = "e+1" }))

-- Scratchpad (Special Workspace)
hl.bind(mainMod .. " + S", hl.dsp.focus({ workspace = "special:magic" }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Etc / Session Control
hl.bind("PRINT", hl.dsp.exec_cmd("flameshot gui"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/reload-config.sh"))
hl.bind(mainMod .. " + M", hl.dsp.exit()) -- Safe translation for the exit dispatcher

-- Mouse Bindings (Scroll through workspaces)
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { mouse = true })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { mouse = true })

-- Mouse Dragging (bindm replacement)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop Multimedia Keys (Volume and LCD Brightness - bindel flags)
local audio_and_light_flags = { locked = true, ignore_mods = true } -- replacement for 'el' flag mapping
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), audio_and_light_flags)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), audio_and_light_flags)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), audio_and_light_flags)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), audio_and_light_flags)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), audio_and_light_flags)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), audio_and_light_flags)

-- Media Player Keys (Playerctl - bindl flag)
local media_flags = { locked = true } -- replacement for 'l' flag mapping
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), media_flags)
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), media_flags)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), media_flags)
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), media_flags)
