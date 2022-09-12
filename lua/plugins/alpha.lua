local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- set menu
dashboard.section.buttons.val = {
    dashboard.button( "p", "  > Projects" , ":Telescope projects<CR>"),
    dashboard.button( "f", "  > Find file", ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}
-- Set header
dashboard.section.header.val = {
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
}
-- dashboard.section.header.val = {
--   [[      .-.   .-.      ]],
--   [[     /   \ /   \     ]],
--   [[ .-. |    |    | .-. ]],
--   [[/   \ \  / \  / /   \]],
--   [[|   |  '`.-.`'  |   |]],
--   [[ \_.' .-`   `-. '._/ ]],
--   [[   .-'         '-.   ]],
--   [[  /               \  ]],
--   [[  |               |  ]],
--   [[   \             /   ]],
--   [[    '.___...___.'    ]],
-- }
-- dashboard.section.header.val = {
--   [[   ██          ██      ]],
--   [[   █▒█        █▒█      ]],
--   [[  █▒███    ███▒█       ]],
--   [[  █▒████████▒▒█        ]],
--   [[  █▒████▒▒█▒▒██        ]],
--   [[  ████▒▒▒▒▒████        ]],
--   [[   █▒▒▒▒▒▒▒████        ]],
--   [[  █▒▒▒▒▒▒▒▒████      █ ]],
--   [[ ██▒█▒▒▒▒▒█▒▒████  █▒█ ]],
--   [[ █▒█●█▒▒▒█●█▒▒███ █▒▒█ ]],
--   [[ █▒▒█▒▒▒▒▒█▒▒▒██ █▒▒█  ]],
--   [[  █▒▒▒=▲=▒▒▒▒███ ██▒█  ]],
--   [[  ██▒▒█♥█▒▒▒▒███  ██▒█ ]],
--   [[    ███▒▒▒▒████    █▒█ ]],
--   [[      ██████        ███]],
--   [[       █▒▒████      ██ ]],
--   [[       █▒▒▒▒▒████  ██  ]],
--   [[       █▒██▒██████▒█   ]],
--   [[       █▒███▒▒▒█████   ]],
--   [[     █▒████▒▒▒▒████    ]],
--   [[      █▒███▒██████     ]],
-- }

-- Set footer
--   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
--   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
--   ```init.lua
--   return require('packer').startup(function()
--       use 'wbthomason/packer.nvim'
--       use {
--           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
--           requires = {'BlakeJC94/alpha-nvim-fortune'},
--           config = function() require("config.alpha") end
--       }
--   end)
--   ```
local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
