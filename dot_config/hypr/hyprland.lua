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

require("hyprland.input")
require("hyprland.keybinds")
require("hyprland.appearance")
require("hyprland.windowrules")
require("hyprland.autostart")

-- TODO: load by hostname
require("hyprland.machines.azusa")
