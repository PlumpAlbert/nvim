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
    { trig = "!", dscr = "convert file type to Ansible file" },
    t("# vim:ft=yaml.ansible:ts=2:sw=0:et")
  )
)

return SNIPPETS
