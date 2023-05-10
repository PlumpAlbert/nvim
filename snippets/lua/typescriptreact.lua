local ls = require("luasnip")
local s = ls.s --> snippet
local t = ls.t --> text node
local i = ls.i --> insert node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local SNIPPETS = {}

table.insert(
  SNIPPETS,
  s(
    { trig = "styles", dscr = "Module styles" },
    fmt(
      [[
// styles
import styles from "{}";
import {{sassBuilder}} from "common/SassModule";

const SC = sassBuilder(styles, false);
        ]],
      {
        i(0, "./styles.module.scss"),
      }
    )
  )
)

return SNIPPETS
