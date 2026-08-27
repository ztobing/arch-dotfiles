hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = true,
        accel_profile = "flat",

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.5,
            clickfinger_behavior = true
        }
    }
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
