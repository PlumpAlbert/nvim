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
    {
      trig = "trfc",
      dscr = "Typed React component",
    },
    fmt(
      [[
import React from "react";

/** @type {{React.ComponentType<IProps>}} */
const {} = ({{ {} }}) => {{
    return null;
}}

export default {};
/**
 * @typedef IProps
 * @property {{string}} [className]
 * CSS className to apply to element
 */
    ]],
      {
        i(1, "MyComponent"),
        i(2, "...props"),
        rep(1),
      }
    )
  )
)

return SNIPPETS
