local components = require("custom.statusline.components")

function status_line()
  local mode = components.get_mode_component()
  local branch = components.get_branch_component()
  local file = components.get_file_component()
  local errors = components.get_errors_component()
  local warnings = components.get_warnings_component()
  local infos = components.get_infos_component()
  local saved = components.get_saved_component()
  local noice_mode = components.get_noice_mode_component()
  local noice_command = components.get_noice_command_component()

  return table.concat({
    components.get_component("StatusMode", mode),
    components.get_component("StatusBranch", branch),
    components.get_component("StatusFile", file),
    components.get_component_separator(),
    components.get_component("NoiceMode", noice_mode),
    components.get_component("NoiceCommand", noice_command),
    components.get_component("StatusSaved", saved),
    components.get_component("StatusErrors", errors),
    components.get_component("StatusWarnings", warnings),
    components.get_component("StatusInfos", infos),
  })
end

vim.cmd([[
  augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.status_line()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.status_line()
    au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.status_line()
  augroup END
]])
