local db = require 'alpha.themes.dashboard'

local header = {
    type = "text",
    val = {
        "                         .^!^                                           .!~:                        ",
        "                    ^!JPB&B!.                                            !&&BPJ!:                   ",
        "                ^?P#@@@@@G.                   :       :                   !@@@@@&BY!:               ",
        "             ^JB@@@@@@@@@7                   .#~     ?P                   .&@@@@@@@@&G?:            ",
        "          .7G@@@@@@@@@@@@#!                  ?@#^   ~@@^                 .5@@@@@@@@@@@@@G7.         ",
        "        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y&@@@@@@@@@@@@@@@@#?.       ",
        "       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  !@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@B!      ",
        "     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ",
        "    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ",
        "   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@?   ",
        "   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGPP5PPPGBB#&#.  ",
        "   ^:..           .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ",
        "                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y.                      ",
        "                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ",
        "                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ",
        "                                         :?G@@@@@@@@@@@@P!.                                         ",
        "                                            ~5@@@@@@@@5^                                            ",
        "                                              ^P@@@@G^                                              ",
        "                                                !#@?                                                ",
        "                                                 :^ ",
    },
    opts = {
        position = "center",
        hl = "DashboardHeader",
    },
}

local heading = {
    type = "text",
    val = "Welcome back!",
    opts = {
        position = "center",
        hl = "DashboardShortCut",
    },
}

local buttons = {
    type = 'group',
    val = {
        db.button('SPC f', " Find files", "<cmd>Telescope find_files<CR>"),
        db.button('SPC s p', " Open projects", "<cmd>Telescope projects<CR>"),
        db.button('SPC s t', " Find word", "<cmd>Telescope live_grep<CR>"),
    },
    opts = {
        position = 'center',
        hl = 'DashboardCenter'
    }
}

return {
    layout = {
        { type = 'padding', val = 2 },
        header,
        { type = 'padding', val = 2 },
        heading,
        { type = 'padding', val = 2 },
        buttons
    }
}
--vim:ft=lua:ts=2:sw=0:et
