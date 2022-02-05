local OSC_PEEK_SEC = 2
local CLEAR_OSD_TIMEOUT = .0001 -- Hack for clearing OSD message upon OSC toggle

-- Assume initial mode is 'auto', actual mode is in osc.lua and cannot be read
local osc_always_on = false

local function toggle_osc_auto_always()
    osc_always_on = not osc_always_on

    mp.commandv('script-message', 'osc-visibility',
        osc_always_on and 'always' or 'auto'
    )
    mp.add_timeout(CLEAR_OSD_TIMEOUT, function ()
        mp.osd_message('')
    end)
end

mp.add_key_binding(nil, 'toggle-osc-auto-always', toggle_osc_auto_always)
