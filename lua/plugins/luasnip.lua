-- vim:ft=lua:ts=4:sw=0
-- Author: Plump Albert (plumpalbert@gmail.com)
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt


-- Config for luasnip
ls.config.set_config {
    updateevents = "TextChanged,TextChangedI",
}

function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

-- Shorthands
local LC = function(args, snip) return snip.env.LINE_COMMENT end
local BS = function(args, snip) return snip.env.BLOCK_COMMENT_START end
local BE = function(args, snip) return snip.env.BLOCK_COMMENT_END end

ls.add_snippets("all", {
    s({
        trig = "@copy",
        name = "Copyright",
        dscr = "Insert copyright data with vim magic function"
    }, fmt(
        '{} vim:ft={}:ts={}:sw=0\n{} Author: Plump Albert (plumpalbert@gmail.com)',
        { f(LC), i(1, vim.bo.filetype), i(2, tostring(vim.bo.tabstop)), f(LC) }
    ))
})
ls.add_snippets("tex", {
    s(
        {
            trig = "fig",
            dscr = "Creates block for inserting image"
        },
        {
            t("\\begin{figure}["), i(1, "H"), t({
                "]",
                "\\centering",
                "\\includegraphics[keepaspectratio,width=\\textwidth]{"
            }), i(2, 'image'), t({
                "}",
                "\\caption{"
            }), i(3, 'Image caption'), t({
                "}",
                "\\label{fig:"
            }), i(0), t({
                "}",
                "\\end{figure}"
            })
        }
    )
})

ls.add_snippets("tex", {
    s(
        {
            trig = '"',
            dscr = "Enquote text"
        },
        {
            t("\\textquote{"), i(0, "text"), t('}'),
        }
    )
})

local bufferName = function(_, snip)
    return snip.env.TM_FILENAME_BASE
end

ls.add_snippets("javascriptreact", {
    s(
        { trig = 'rfc', dscr = 'Create React Functional component' },
        {
            t({ 'import React from "react";', '' }),
            t({ '', "const " }), f(bufferName), t(" = ({"),
            i(1, "...props"),
            t({ "}) => {", '' }),
            i(0),
            t({ '', "\treturn null;", '' }),
            t({ "}",
                ""
            }),
            t({ '', 'export default ' }),
            f(bufferName),
        }
    )
})

return ls
