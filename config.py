# ~/.config/qutebrowser/config.py

# Load existing settings made via :set
config.load_autoconfig()

# Import your modules (relative imports work because cwd is the config dir)
from modules.appearance import apply as apply_appearance
# from modules.performance import apply as apply_performance
from modules.keybindings import apply as apply_keybindings
from modules.theme import apply as apply_theme

# Run them in a clear order
apply_appearance(c, config)
apply_theme(c, config)
# apply_performance(c, config)
apply_keybindings(c, config)
