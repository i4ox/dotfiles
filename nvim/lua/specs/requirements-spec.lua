return {
  { "nvim-lua/plenary.nvim" },
  {
    "echasnovski/mini.icons",
    lazy = true,
    init = function()
      package.preload["nvimd-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    config = function()
      require("mini.icons").setup {
        file = {
          [".keep"] = { glyph = "", hl = "MiniIconsGrey" },
          ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
        },
        filetype = {
          dotenv = { glyph = "", hl = "MiniIconsYellow" },
        },
      }
    end,
  },
}
