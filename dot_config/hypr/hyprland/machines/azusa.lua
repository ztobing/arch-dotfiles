--== Display
local internalDisplayId = "desc:Samsung Display Corp. ATNA40HQ01-0"

hl.monitor({
    output = internalDisplayId,
    mode = "2880x1800@120.00Hz",
    position = "0x0",
    scale = 1.6,
    vrr = true,
    bitdepth = 10,
    supports_wide_color = true,
    supports_hdr = true,
    min_luminance = 0,
    max_luminance = 1100,
    cm = "dp3",
})

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
    monitor = internalDisplayId,
    persistent = true,
    default = true
})

for i = 1 , 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = internalDisplayId,
        persistent = true
    })
end

--== Startup Apps
hl.on("hyprland.start", function ()
    hl.exec_cmd("flatpak run com.github.wwmm.easyeffects --gapplication-service")
end)