def apply(c, config):
    # === Vague Theme (Updated) ===
    base00 = "#141415"  # background
    base01 = "#151515"  # inactive background
    base02 = "#252530"  # line / subtle contrast
    base03 = "#606079"  # comment / muted text
    base04 = "#cdcdcd"  # foreground / primary text
    base05 = "#c3c3d5"  # property / secondary text
    base06 = "#e8b589"  # string / accent yellow
    base07 = "#9bb4bc"  # type / blue tone

    red     = "#d8647e"  # error
    green   = "#7fa563"  # success / plus
    yellow  = "#f3be7c"  # warning / delta
    blue    = "#6e94b2"  # keyword
    pink    = "#c48282"  # function
    cyan    = "#b4d4cf"  # builtin
    purple  = "#7e98e8"  # hint / link highlight

    cursor_bg = "#878787"   # float border tone
    cursor_fg = "#141415"   # dark bg for contrast
    selection_bg = "#333738"  # visual selection
    selection_fg = "#cdcdcd"  # text on selection

    # Completion
    c.colors.completion.fg = base03
    c.colors.completion.odd.bg = base01
    c.colors.completion.even.bg = base00
    c.colors.completion.category.fg = blue
    c.colors.completion.category.bg = base00
    c.colors.completion.item.selected.fg = base05
    c.colors.completion.item.selected.bg = selection_bg
    c.colors.completion.item.selected.border.top = selection_bg
    c.colors.completion.item.selected.border.bottom = selection_bg
    c.colors.completion.scrollbar.bg = base00
    c.colors.completion.scrollbar.fg = base02

    # Statusbar
    c.colors.statusbar.normal.bg = base01
    c.colors.statusbar.normal.fg = base04
    c.colors.statusbar.insert.bg = base01
    c.colors.statusbar.insert.fg = yellow
    c.colors.statusbar.passthrough.bg = base01
    c.colors.statusbar.command.bg = base01
    c.colors.statusbar.command.fg = yellow
    c.colors.statusbar.url.fg = yellow
    c.colors.statusbar.url.success.https.fg = green
    c.colors.statusbar.url.error.fg = red

    # Tabs
    c.colors.tabs.bar.bg = base01
    c.colors.tabs.odd.bg = base01
    c.colors.tabs.odd.fg = blue
    c.colors.tabs.even.bg = base01
    c.colors.tabs.even.fg = blue
    c.colors.tabs.selected.odd.bg = base01
    c.colors.tabs.selected.odd.fg = pink
    c.colors.tabs.selected.even.bg = base01
    c.colors.tabs.selected.even.fg = pink

    # Hints
    c.colors.hints.fg = base05
    c.colors.hints.bg = base00
    c.colors.hints.match.fg = cyan

    # Messages
    c.colors.messages.error.bg = red
    c.colors.messages.error.fg = base05
    c.colors.messages.warning.bg = yellow
    c.colors.messages.info.bg = base00
    c.colors.messages.info.fg = base03

    # Downloads
    c.colors.downloads.bar.bg = base00
    c.colors.downloads.start.fg = base00
    c.colors.downloads.start.bg = blue
    c.colors.downloads.stop.bg = green
    c.colors.downloads.error.fg = red
