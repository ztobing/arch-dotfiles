hl.config({
    general = {
        layout = "dwindle",
        gaps_in = 4,
        gaps_out = 4,
        border_size = 1,
        resize_on_border = true,
        col = {
            active_border = "#aaaaaa33",
            inactive_border = "#59595911",
        },
        allow_tearing = true,
    },

    dwindle = {
        preserve_split = true,
        force_split = 2
    },

    decoration = {
        rounding = 4,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        dim_special = 0.5,
        shadow = {
            enabled = false
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 3,
            vibrancy = 0.1696,
        }
    },

    misc = {
        force_default_wallpaper = false,
        disable_hyprland_logo = true,
        animate_mouse_windowdragging = true, -- TODO: check the effect
        focus_on_activate = true,
    },

    ecosystem = {
        no_donation_nag = true,
    },

    animations = {
        enabled = true,
    },
})

-- Bezier curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })
hl.curve("easeOutExpo",    { type = "bezier", points = { {0.16, 1},    {0.3, 1}  } })

-- Animations
hl.animation({ leaf = "global",             enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",             enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",            enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",          enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",         enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",             enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",            enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",               enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",             enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",           enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",          enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",       enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",      enabled = true, speed = 1.39, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default", style = "fade" })
hl.animation({ leaf = "workspacesIn",       enabled = true, speed = 3,  bezier = "easeOutExpo", style = "fade" })
hl.animation({ leaf = "workspacesOut",      enabled = true, speed = 10, bezier = "easeOutExpo", style = "fade" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 5,  bezier = "easeOutExpo", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut",enabled = true, speed = 6,  bezier = "easeOutExpo", style = "slidevert" })
hl.animation({ leaf = "zoomFactor",         enabled = true, speed = 7,  bezier = "quick" })

hl.layer_rule({
    name  = "waybar",
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "quickshell",
    match = { namespace = "gtk4-layer-shell" },
    blur = true,
    ignore_alpha = 0,
})

hl.layer_rule({
    name  = "rofi",
    match = { namespace = "rofi" },
    blur = true,
    ignore_alpha = 0,
    no_anim = true,
})

hl.layer_rule({
    name  = "notifications",
    match = { namespace = "notifications" },
    blur = true,
    ignore_alpha = 0,
    animation = "slidefade",
})