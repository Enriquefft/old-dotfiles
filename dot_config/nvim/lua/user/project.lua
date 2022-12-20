local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  return
end
project.setup({

  -- NOTE: lsp detection will get annoying with multiple langs in one project
  detection_methods = { "lsp", "pattern" },

  -- patterns used to detect root dir, when **"pattern"** is in detection_methods
  patterns = { ".git", "Makefile", "package.json", "CMakeLists.txt" },
})

local tele_status_ok, telescope = pcall(require, "telescope")
if not tele_status_ok then
  return
end

telescope.load_extension('projects')
--[[
**project.nvim** comes with the following mappings:

| Normal mode | Insert mode | Action                     |
| ----------- | ----------- | -------------------------- |
| f           | <c-f>     | find_project_files       |
| b           | <c-b>     | browse_project_files     |
| d           | <c-d>     | delete_project            |
| s           | <c-s>     | search_in\_project_files |
| r           | <c-r>     | recent_project_files     |
| w           | <c-w>     | change_working_directory |
--]]
