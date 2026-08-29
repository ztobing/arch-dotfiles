function get_hostname()
    local f = io.open("/etc/hostname", "r")
    if not f then return "unknown" end
    local hostname = f:read("*l")  -- reads first line, newline already stripped
    f:close()
    return hostname
end
