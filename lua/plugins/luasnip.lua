local ls = require"luasnip"
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

-- Shorthands
local LC = function(args, snip) return snip.env.LINE_COMMENT end
local BS = function(args, snip) return snip.env.BLOCK_COMMENT_START end
local BE = function(args, snip) return snip.env.BLOCK_COMMENT_END end

ls.snippets = {
	all = {
		s({
			trig = "@copy",
			name = "Copyright",
			dscr = "Insert copyright data with vim magic function"
		}, fmt(
			'{} vim:ft={}:ts={}:sw=0\n{} Author: Plump Albert (plumpalbert@gmail.com)',
			{ f(LC), i(1, vim.bo.filetype), i(2, tostring(vim.bo.tabstop)), f(LC) }
		))
	}
}
