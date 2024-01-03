vim.g.my_config = "yaya"

-- import core for base config and lazy.nvim package manager
require(vim.g.my_config .. ".core")
require(vim.g.my_config .. ".lazy")
