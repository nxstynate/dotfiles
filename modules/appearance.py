def apply(c, config):
    # Webpage dark mode
    c.colors.webpage.darkmode.enabled = True
    c.colors.webpage.preferred_color_scheme = "dark"
    c.colors.webpage.darkmode.algorithm = "lightness-cielab"
    c.colors.webpage.darkmode.policy.page = "always"  # force on all sites
    c.colors.webpage.darkmode.policy.images = "never"  # avoid messing up images

    # Tabs position
    c.tabs.position = "bottom"
    c.downloads.position = "bottom"

    # Fonts (UI)
    c.fonts.default_family = "JetBrainsMono Nerd Font Mono"
    c.fonts.default_size = "16pt"
    c.fonts.hints = "bold 12pt JetBrainsMono Nerd Font Mono"
    c.fonts.statusbar = "20pt JetBrainsMono Nerd Font Mono"
    c.fonts.contextmenu = "bold 18pt JetBrainsMono Nerd Font Mono"
    c.fonts.prompts = " bold 18pt JetBrainsMono Nerd Font Mono"

    # Fonts (web content)
    c.fonts.web.family.standard = "JetBrainsMono Nerd Font Mono"
    c.fonts.web.family.serif = "JetBrainsMono Nerd Font Mono"
    c.fonts.web.family.sans_serif = "JetBrainsMono Nerd Font Mono"
    c.fonts.web.family.fixed = "JetBrainsMono Nerd Font Mono"
    c.fonts.web.size.default = 16  # Default font size in px
    c.fonts.web.size.default_fixed = 14
    c.fonts.web.size.minimum = 10
