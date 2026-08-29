--== env.conf
-- Programs
TERMINAL = "kitty"
FILE_MANAGER = "nautilus"
MENU = "rofi -show drun"

-- Cursor (Environment Variables)
hl.env("XCURSOR_THEME", "macOS")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "macOS")
hl.env("HYPRCURSOR_SIZE", "24")

require("hyprland.utils")

local hostname = get_hostname()

if hostname == "azusa" then
    require("hyprland.machines.azusa")
elseif hostname == "yuuka" then
    require("hyprland.machines.yuuka")
else
    hl.notification.create({ text = "Unrecognized hostname: " .. hostname .. ", loading shared config only", timeout = 10000, icon = "error" })
end

require("hyprland.input")
require("hyprland.keybinds")
require("hyprland.appearance")
require("hyprland.windowrules")
require("hyprland.autostart")
