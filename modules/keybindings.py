def apply(c, config):
    # External helpers
    config.bind('go', 'spawn --detach "C:\\Users\\Admin\\scoop\\shims\\chrome.exe" --app={url}')
    config.bind(';go', 'hint links spawn --detach "C:\\Users\\Admin\\scoop\\shims\\chrome.exe" --new-window {hint-url}')
    config.bind('gm', 'spawn --detach mpv --border=no --ontop=yes --geometry=50%:50% {url}')

    # Navigation
    config.bind('<Shift-j>', 'tab-prev')
    config.bind('<Shift-k>', 'tab-next')
    config.bind('<Ctrl-1>', 'tab-select 1')
    config.bind('<Ctrl-2>', 'tab-select 2')
    config.bind('<Ctrl-3>', 'tab-select 3')
    config.bind('<Ctrl-4>', 'tab-select 4')
    config.bind('<Ctrl-5>', 'tab-select 5')
    config.bind('<Ctrl-6>', 'tab-select 6')
    config.bind('<Ctrl-7>', 'tab-select 7')
    config.bind('<Ctrl-8>', 'tab-select 8')
    config.bind('<Ctrl-9>', 'tab-select 9')
    config.bind('jk', 'mode-leave', mode='insert')
