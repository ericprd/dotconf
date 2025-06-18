return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        " _____                                  _          _____            _     ",
        "/  ___|                                (_)        |_   _|          | |    ",
        "\\ `--.  _   _  _ __    ___  _ __  __ _  _  ____ ___ | |  ___   ___ | |__  ",
        " `--. \\| | | || '_ \\  / _ \\| '__|/ _` || ||_  // _ \\| | / _ \\ / __|| '_ \\ ",
        "/\\__/ /| |_| || | | ||  __/| |  | (_| || | / /|  __/| ||  __/| (__ | | | |",
        "\\____/  \\__, ||_| |_| \\___||_|   \\__, ||_|/___|\\___|\\_/ \\___| \\___||_| |_|",
        "         __/ |                    __/ |                                   ",
        "        |___/                    |___/                                    ",
        "",
        "",
        "",
    }

    -- Set menus
    dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
        dashboard.button("r", "󰈢  Recent Files", ":Telescope oldfiles<CR>"),
        dashboard.button("l", "󰱼  Plugins", ":Lazy<CR>"),
        dashboard.button("u", "  Update Plugins", ":Lazy update<CR>"),
        dashboard.button("q", "󰗼  Quit", ":qa<CR>"),
    }


    dashboard.section.footer.val = {
        "",
        "",
        "0xBADC0DE",
    }

    alpha.setup(dashboard.config)

  end,
}

