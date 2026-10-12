local map = vim.keymap.set
local vscode = require("vscode")

local function action(name)
  return function()
    vscode.action(name)
  end
end

map("n", "<leader>e", action("workbench.view.explorer"), { desc = "Open VS Code explorer" })
map("n", "<leader><Space>", action("workbench.action.quickOpen"), { desc = "Quick open files" })
map("n", "<leader>/", action("workbench.action.findInFiles"), { desc = "Find in files" })
map("n", "<leader>,", action("workbench.action.showAllEditors"), { desc = "Open editor list" })
map("n", "<leader>t", action("workbench.action.terminal.toggleTerminal"), { desc = "Toggle terminal" })
map("n", "<leader>b", action("editor.debug.action.toggleBreakpoint"), { desc = "Toggle breakpoint" })
map("n", "<leader>sp", action("workbench.actions.view.problems"), { desc = "Open problems" })
map("n", "<leader>cn", action("notifications.clearAll"), { desc = "Clear notifications" })
map("n", "<leader>cp", action("workbench.action.showCommands"), { desc = "Command palette" })

map("n", "<leader>ls", action("editor.action.referenceSearch.trigger"), { desc = "LSP references" })
map("n", "<leader>ld", action("editor.action.peekDefinition"), { desc = "Peek definition" })
map("n", "<leader>lS", action("workbench.action.showAllSymbols"), { desc = "Workspace symbols" })
map("n", "<leader>la", action("editor.action.quickFix"), { desc = "Code actions" })
map("n", "<leader>lt", action("editor.action.goToTypeDefinition"), { desc = "Go to type definition" })
map("n", "<leader>lf", action("editor.action.formatDocument"), { desc = "Format document" })

map("n", "]d", action("editor.action.marker.next"), { desc = "Next diagnostic" })
map("n", "[d", action("editor.action.marker.prev"), { desc = "Previous diagnostic" })
map("n", "]c", action("workbench.action.editor.nextChange"), { desc = "Next change" })
map("n", "[c", action("workbench.action.editor.previousChange"), { desc = "Previous change" })

map("n", "zM", action("editor.foldAll"), { desc = "Fold all" })
map("n", "zR", action("editor.unfoldAll"), { desc = "Unfold all" })
map("n", "zc", action("editor.fold"), { desc = "Fold" })
map("n", "zC", action("editor.foldRecursively"), { desc = "Fold recursively" })
map("n", "zo", action("editor.unfold"), { desc = "Unfold" })
map("n", "zO", action("editor.unfoldRecursively"), { desc = "Unfold recursively" })
map("n", "za", action("editor.toggleFold"), { desc = "Toggle fold" })
map("n", "zk", action("editor.gotoPreviousFold"), { desc = "Previous fold" })
map("n", "zj", action("editor.gotoNextFold"), { desc = "Next fold" })
