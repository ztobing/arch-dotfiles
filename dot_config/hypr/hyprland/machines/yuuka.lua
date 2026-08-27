--== Display
local mainDisplayId = "desc:CMT GP27-FQS EK1232600017"

-- Main Display
hl.monitor({
    output = mainDisplayId,
    mode = "2560x1440@165.00Hz",
    position = "0x0",
    scale = 1,
    vrr = 3,
    bitdepth = 10,
    supports_wide_color = true,
    supports_hdr = true,
    min_luminance = 0,
    max_luminance = 1000,
    cm = "srgb",
})

-- TCL C745 TV
local display_ids = {
    "desc:XXX Beyo TV 0x00010000",
    "desc:XXX Beyond TV 0x00010000"
}

for _, display_id in ipairs(display_ids) do
    hl.monitor({
        output = display_id,
        disabled = true,
        mode = "3840x2160@120.00Hz",
        position = "-3840x0",
        bitdepth = 10,
        supports_wide_color = 1,
        scale = 2,
    })
end

hl.config({
    render = {
        cm_auto_hdr = true,
    },

    xwayland = {
        force_zero_scaling = true,
    }
})

--== Workspaces
hl.workspace_rule({
    workspace = "1",
    monitor = mainDisplayId,
    persistent = true,
    default = true
})

for i = 1 , 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = mainDisplayId,
        persistent = true
    })
end

--== Startup Apps
hl.on("hyprland.start", function ()
    hl.exec_cmd("flatpak run com.github.wwmm.easyeffects --gapplication-service")
end)