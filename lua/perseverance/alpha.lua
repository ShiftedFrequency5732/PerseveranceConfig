-- Safely require Alpha.
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end


-- Table of ascii arts that will be printed out on the greeter.
local ascii_arts = {
    {
        [[  _____                                                      ]],
        [[ |  __ \                                                     ]],
        [[ | |__) |__ _ __ ___  _____   _____ _ __ __ _ _ __   ___ ___ ]],
        [[ |  ___/ _ \ '__/ __|/ _ \ \ / / _ \ '__/ _` | '_ \ / __/ _ \]],
        [[ | |  |  __/ |  \__ \  __/\ V /  __/ | | (_| | | | | (_|  __/]],
        [[ |_|   \___|_|  |___/\___| \_/ \___|_|  \__,_|_| |_|\___\___|]]
    },

    {
        [[______                                                     ]],
        [[| ___ \                                                    ]],
        [[| |_/ /__ _ __ ___  _____   _____ _ __ __ _ _ __   ___ ___ ]],
        [[|  __/ _ \ '__/ __|/ _ \ \ / / _ \ '__/ _` | '_ \ / __/   \]],
        [[| | |  __/ |  \__ \  __/\ V /  __/ | | (_| | | | | (_|  __/]],
        [[\_|  \___|_|  |___/\___| \_/ \___|_|  \__,_|_| |_|\___\___|]]
    },

    {
        [[   ___                                                      ]],
        [[  / _ \___ _ __ ___  _____   _____ _ __ __ _ _ __   ___ ___ ]],
        [[ / /_)/ _ \ '__/ __|/ _ \ \ / / _ \ '__/ _` | '_ \ / __/ _ \]],
        [[/ ___/  __/ |  \__ \  __/\ V /  __/ | | (_| | | | | (_|  __/]],
        [[\/    \___|_|  |___/\___| \_/ \___|_|  \__,_|_| |_|\___\___|]]
    },

    {
        [[██████╗ ███████╗██████╗ ███████╗███████╗██╗   ██╗███████╗██████╗  █████╗ ███╗   ██╗ ██████╗███████╗]],
        [[██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██║   ██║██╔════╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝]],
        [[██████╔╝█████╗  ██████╔╝███████╗█████╗  ██║   ██║█████╗  ██████╔╝███████║██╔██╗ ██║██║     █████╗  ]],
        [[██╔═══╝ ██╔══╝  ██╔══██╗╚════██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══╝  ]],
        [[██║     ███████╗██║  ██║███████║███████╗ ╚████╔╝ ███████╗██║  ██║██║  ██║██║ ╚████║╚██████╗███████╗]],
        [[╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝]]
    },

    {
        [[ .S_sSSs      sSSs   .S_sSSs      sSSs    sSSs   .S    S.     sSSs   .S_sSSs     .S_SSSs     .S_sSSs      sSSs    sSSs  ]],
        [[.SS~YS%%b    d%%SP  .SS~YS%%b    d%%SP   d%%SP  .SS    SS.   d%%SP  .SS~YS%%b   .SS~SSSSS   .SS~YS%%b    d%%SP   d%%SP  ]],
        [[S%S   `S%b  d%S'    S%S   `S%b  d%S'    d%S'    S%S    S%S  d%S'    S%S   `S%b  S%S   SSSS  S%S   `S%b  d%S'    d%S'    ]],
        [[S%S    S%S  S%S     S%S    S%S  S%|     S%S     S%S    S%S  S%S     S%S    S%S  S%S    S%S  S%S    S%S  S%S     S%S     ]],
        [[S%S    d*S  S&S     S%S    d*S  S&S     S&S     S&S    S%S  S&S     S%S    d*S  S%S SSSS%S  S%S    S&S  S&S     S&S     ]],
        [[S&S   .S*S  S&S_Ss  S&S   .S*S  Y&Ss    S&S_Ss  S&S    S&S  S&S_Ss  S&S   .S*S  S&S  SSS%S  S&S    S&S  S&S     S&S_Ss  ]],
        [[S&S_sdSSS   S&S~SP  S&S_sdSSS   `S&&S   S&S~SP  S&S    S&S  S&S~SP  S&S_sdSSS   S&S    S&S  S&S    S&S  S&S     S&S~SP  ]],
        [[S&S~YSSY    S&S     S&S~YSY%b     `S*S  S&S     S&S    S&S  S&S     S&S~YSY%b   S&S    S&S  S&S    S&S  S&S     S&S     ]],
        [[S*S         S*b     S*S   `S%b     l*S  S*b     S*b    S*S  S*b     S*S   `S%b  S*S    S&S  S*S    S*S  S*b     S*b     ]],
        [[S*S         S*S.    S*S    S%S    .S*P  S*S.    S*S.   S*S  S*S.    S*S    S%S  S*S    S*S  S*S    S*S  S*S.    S*S.    ]],
        [[S*S          SSSbs  S*S    S&S  sSS*S    SSSbs   SSSbs_S*S   SSSbs  S*S    S&S  S*S    S*S  S*S    S*S   SSSbs   SSSbs  ]],
        [[S*S           YSSP  S*S    SSS  YSS'      YSSP    YSSP~SSS    YSSP  S*S    SSS  SSS    S*S  S*S    SSS    YSSP    YSSP  ]],
        [[SP                  SP                                              SP                 SP   SP                          ]],
        [[Y                   Y                                               Y                  Y    Y                           ]]
    },

    {
        [[ ____                                                                                    ]],
        [[/\  _`\                                                                                  ]],
        [[\ \ \L\ \ __   _ __   ____     __   __  __     __   _ __    __      ___     ___     __   ]],
        [[ \ \ ,__/'__`\/\`'__\/',__\  /'__`\/\ \/\ \  /'__`\/\`'__\/'__`\  /' _ `\  /'___\ /'__`\ ]],
        [[  \ \ \/\  __/\ \ \//\__, `\/\  __/\ \ \_/ |/\  __/\ \ \//\ \L\.\_/\ \/\ \/\ \__//\  __/ ]],
        [[   \ \_\ \____\\ \_\\/\____/\ \____\\ \___/ \ \____\\ \_\\ \__/.\_\ \_\ \_\ \____\ \____\]],
        [[    \/_/\/____/ \/_/ \/___/  \/____/ \/__/   \/____/ \/_/ \/__/\/_/\/_/\/_/\/____/\/____/]]
    },

    {
        [[ /$$$$$$$                                                                                                             ]],
        [[| $$__  $$                                                                                                            ]],
        [[| $$  \ $$ /$$$$$$   /$$$$$$   /$$$$$$$  /$$$$$$  /$$    /$$ /$$$$$$   /$$$$$$  /$$$$$$  /$$$$$$$   /$$$$$$$  /$$$$$$ ]],
        [[| $$$$$$$//$$__  $$ /$$__  $$ /$$_____/ /$$__  $$|  $$  /$$//$$__  $$ /$$__  $$|____  $$| $$__  $$ /$$_____/ /$$__  $$]],
        [[| $$____/| $$$$$$$$| $$  \__/|  $$$$$$ | $$$$$$$$ \  $$/$$/| $$$$$$$$| $$  \__/ /$$$$$$$| $$  \ $$| $$      | $$$$$$$$]],
        [[| $$     | $$_____/| $$       \____  $$| $$_____/  \  $$$/ | $$_____/| $$      /$$__  $$| $$  | $$| $$      | $$_____/]],
        [[| $$     |  $$$$$$$| $$       /$$$$$$$/|  $$$$$$$   \  $/  |  $$$$$$$| $$     |  $$$$$$$| $$  | $$|  $$$$$$$|  $$$$$$$]],
        [[|__/      \_______/|__/      |_______/  \_______/    \_/    \_______/|__/      \_______/|__/  |__/ \_______/ \_______/]]
    },

    {
        [[██████╗░███████╗██████╗░░██████╗███████╗██╗░░░██╗███████╗██████╗░░█████╗░███╗░░██╗░█████╗░███████╗]],
        [[██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██║░░░██║██╔════╝██╔══██╗██╔══██╗████╗░██║██╔══██╗██╔════╝]],
        [[██████╔╝█████╗░░██████╔╝╚█████╗░█████╗░░╚██╗░██╔╝█████╗░░██████╔╝███████║██╔██╗██║██║░░╚═╝█████╗░░]],
        [[██╔═══╝░██╔══╝░░██╔══██╗░╚═══██╗██╔══╝░░░╚████╔╝░██╔══╝░░██╔══██╗██╔══██║██║╚████║██║░░██╗██╔══╝░░]],
        [[██║░░░░░███████╗██║░░██║██████╔╝███████╗░░╚██╔╝░░███████╗██║░░██║██║░░██║██║░╚███║╚█████╔╝███████╗]],
        [[╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═════╝░╚══════╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝░╚════╝░╚══════╝]]
    },

    {
        [[    ▄███████▄    ▄████████    ▄████████    ▄████████    ▄████████  ▄█    █▄     ▄████████    ▄████████    ▄████████ ███▄▄▄▄    ▄████████    ▄████████]],
        [[  ███    ███   ███    ███   ███    ███   ███    ███   ███    ███ ███    ███   ███    ███   ███    ███   ███    ███ ███▀▀▀██▄ ███    ███   ███    ███ ]],
        [[  ███    ███   ███    █▀    ███    ███   ███    █▀    ███    █▀  ███    ███   ███    █▀    ███    ███   ███    ███ ███   ███ ███    █▀    ███    █▀  ]],
        [[  ███    ███  ▄███▄▄▄      ▄███▄▄▄▄██▀   ███         ▄███▄▄▄     ███    ███  ▄███▄▄▄      ▄███▄▄▄▄██▀   ███    ███ ███   ███ ███         ▄███▄▄▄     ]],
        [[▀█████████▀  ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████ ▀▀███▀▀▀     ███    ███ ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ▀███████████ ███   ███ ███        ▀▀███▀▀▀     ]],
        [[  ███          ███    █▄  ▀███████████          ███   ███    █▄  ███    ███   ███    █▄  ▀███████████   ███    ███ ███   ███ ███    █▄    ███    █▄  ]],
        [[  ███          ███    ███   ███    ███    ▄█    ███   ███    ███ ███    ███   ███    ███   ███    ███   ███    ███ ███   ███ ███    ███   ███    ███ ]],
        [[ ▄████▀        ██████████   ███    ███  ▄████████▀    ██████████  ▀██████▀    ██████████   ███    ███   ███    █▀   ▀█   █▀  ████████▀    ██████████ ]],
        [[                            ███    ███                                                     ███    ███                                                ]]
    },

    {
        [[________                                                                                                    ]],
        [[`MMMMMMMb.                                                                                                  ]],
        [[ MM    `Mb                                                                                                  ]],
        [[ MM     MM   ____  ___  __   ____     ____  ____    ___  ____  ___  __    ___   ___  __     ____     ____   ]],
        [[ MM     MM  6MMMMb `MM 6MM  6MMMMb\  6MMMMb `MM(    )M' 6MMMMb `MM 6MM  6MMMMb  `MM 6MMb   6MMMMb.  6MMMMb  ]],
        [[ MM    .M9 6M'  `Mb MM69 " MM'    ` 6M'  `Mb `Mb    d' 6M'  `Mb MM69 " 8M'  `Mb  MMM9 `Mb 6M'   Mb 6M'  `Mb ]],
        [[ MMMMMMM9' MM    MM MM'    YM.      MM    MM  YM.  ,P  MM    MM MM'        ,oMM  MM'   MM MM    `' MM    MM ]],
        [[ MM        MMMMMMMM MM      YMMMMb  MMMMMMMM   MM  M   MMMMMMMM MM     ,6MM9'MM  MM    MM MM       MMMMMMMM ]],
        [[ MM        MM       MM          `Mb MM         `Mbd'   MM       MM     MM'   MM  MM    MM MM       MM       ]],
        [[ MM        YM    d9 MM     L    ,MM YM    d9    YMP    YM    d9 MM     MM.  ,MM  MM    MM YM.   d9 YM    d9 ]],
        [[_MM_        YMMMM9 _MM_    MYMMMM9   YMMMM9      M      YMMMM9 _MM_    `YMMM9'Yb_MM_  _MM_ YMMMM9   YMMMM9  ]]
    }
}


-- Require theme for alpha, no need to safely require it as we safely required alpha.
local dashboard = require("alpha.themes.dashboard")

-- Randomly pick ascii art to print to greet the user.
dashboard.section.header.val = ascii_arts[math.random(#ascii_arts)]

local config_path = vim.fn.stdpath("config") .. "/init.lua"
local help_path = vim.fn.stdpath("config") .. "/help.txt"

dashboard.section.buttons.val = {
    dashboard.button("f", "󰥨    Find file", ":Telescope find_files<CR>"),
    dashboard.button("e", "    New file", ":ene <BAR> startinsert<CR>"),
    dashboard.button("r", "󰥨    Recently used files", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "    Find text", ":Telescope live_grep<CR>"),
    dashboard.button("c", "    Configuration", ":e " .. config_path .. "<CR>"),
    dashboard.button("h", "󰞋    Help", ":e " .. help_path .. "<CR>"),
    dashboard.button("q", "󰩈    Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.val = "Happy Coding!"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

