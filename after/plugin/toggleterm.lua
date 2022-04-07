-- https://github.com/akinsho/toggleterm.nvim
local Toggleterm = require("toggleterm")
Toggleterm.setup(
    {
        --  開啟的終端默認進入插入模式
        start_in_insert = true,
        -- 設置終端打開的大小
        size = 6,
        -- 打開普通終端時，關閉拼寫檢查
        on_open = function()
            vim.cmd("setlocal nospell")
        end
    }
)
-- 新建終端
local Terminal = require("toggleterm.terminal").Terminal
local function inInsert()
    -- 刪除 Esc 的映射
     vim.api.nvim_del_keymap("t","<Esc>")
end
-- 新建浮動終端
local floatTerm =
    Terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            inInsert()
            -- 浮動終端中 Esc 是退出
            vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>", {noremap = true, silent = true})
        end,
        on_close = function()
            -- 重新映射 Esc
            vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
        end
    }
)
-- 新建 lazygit 終端
local lazyGit =
    Terminal:new(
    {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            inInsert()
            -- lazygit 中 q 是退出
            vim.api.nvim_buf_set_keymap(term.bufnr, "i", "q", "<cmd>close<CR>", {noremap = true, silent = true})
        end,
        on_close = function()
            -- 重新映射 Esc
            vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
        end
    }
)
-- 定義新的方法
Toggleterm.float_toggle = function()
    floatTerm:toggle()
end
Toggleterm.lazygit_toggle = function()
    lazyGit:toggle()
end

-- 退出終端插入模式
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})
-- 打開普通終端
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", {noremap = true, silent = true})
-- 打開浮動終端
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", {noremap = true, silent = true})
-- 打開lazy git 終端
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", {noremap = true, silent = true})
-- 打開或關閉所有終端
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", {noremap = true, silent = true})
-- 要需創建多個終端，可：
-- 1 <鍵位> leader tt
-- 2 <鍵位>
-- ... <鍵位>
