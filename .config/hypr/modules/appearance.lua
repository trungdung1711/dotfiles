-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/configuring/core/config-options/
hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 2,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(cba6f7ee)", "rgba(f5c2e7ee)"}, angle = 45 },
            inactive_border = "rgba(313244aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,

        layout = "scrolling",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Configuration for scrolling
hl.config({
    scrolling = {
        fullscreen_on_one_column = true, 
        column_width = 0.75,              
        focus_fit_method = 1,            
        follow_focus = 1,                
        follow_min_visible = 0.4,        
        explicit_column_widths = "0.25, 0.5, 0.75, 1.0",
        wrap_focus = true,
        wrap_swapcol = true,
        direction = "right",
    }
})
