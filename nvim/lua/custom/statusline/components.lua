local M = {}

function M.get_branch_component()
  if not vim.g.loaded_fugitive then
    return ""
  end

  local branch = vim.fn.FugitiveHead(10)

  if branch ~= "" then
    if string.len(branch) > 15 then
      branch = branch:sub(1, 15) .. "..."
    end

    return " " .. branch
  end

  return " No branch"
end

function M.get_warnings_component()
  local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  return warning_count
end

function M.get_errors_component()
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  return error_count
end

function M.get_infos_component()
  local info_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  return info_count
end

function M.get_file_component()
  local file = vim.fn.expand("%:t")

  if file == "" then
    file = "[no name]"
  end

  if string.match(file, "NvimTree") then
    file = ""
  end

  return file
end

local function get_mode_group(mode)
  local groups = {
    n = "n",
    i = "i",
    v = "v",
    V = "v",
    [""] = "v",
    c = "c",
    s = "s",
    S = "s",
    [""] = "s",
    R = "r",
    r = "p",
    rm = "m",
    Rv = "v",
    ["r?"] = "c",
    ["!"] = "s",
    ["t"] = "t",
  }

  local group = groups[mode] or "unknown"

  return group:upper()
end

function M.get_mode_component()
  local mode = vim.fn.mode()
  return get_mode_group(mode)
end

function M.get_saved_component()
  local saved = vim.bo.modified and "*" or ""
  return saved
end

function M.get_component(tag, value)
  if value == "" then
    return ""
  end

  return "%#" .. tag .. "# " .. value .. " "
end

function M.get_component_separator()
  return "%="
end

function M.get_noice_mode_component()
  local noice = require("noice").api.statusline.mode
  if noice.has() then
    return noice.get()
  end
  return ""
end

function M.get_noice_command_component()
  local noice = require("noice").api.status.command
  if noice.has() then
    return noice.get()
  end
  return ""
end

return M
