config.load_autoconfig(False) # Disable the autoconfig.yml
config.set('content.proxy', 'http://127.0.0.1:12334') # Setup the proxy
config.set('content.headers.user_agent', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.3') # Setup the User-Agent
config.set('content.javascript.enabled', True) # Enable the JavaScript
config.set('editor.command', ['ghostty', '-e', 'nvim {file}']) # gvim -> neovim
