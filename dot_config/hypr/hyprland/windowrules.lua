hl.window_rule({ -- Might not be doing anything
    name = "Suppress maximize events",
    enabled = true,
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.window_rule({
    name = "Steam - Float friends list",
    enabled = true,
    match = { class = "Steam", title = "Friends List" },
    float = true
})

hl.window_rule({
    name = "Flameshot Animation",
    enabled = true,
    match = { class = "flameshot" },
    float = true,
    animation = "popin 100%"
})

-- TODO: Migrate Zen Browser PiP on corner config

hl.window_rule({
    name = "Muse Dash",
    enabled = true,
    match = { class = "MuseDash" },
    immediate = true,
})