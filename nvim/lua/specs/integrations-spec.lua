return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    config = function()
      require("avante").setup{
        provider = "ollama",
        vendors = {
          ollama = {
             __inherited_from = "openai",
            api_key_name = "",
            endpoint = "http://127.0.0.1:11434/v1",
            model = "codegemma:7b",
          },
        },
      }
    end,
  },
}
