def apply(c, config):
    # Startup / session behavior
    c.content.fullscreen.window = True
    # c.window.transparent = True
    # c.scrolling.smooth = True
    # c.history_gap_interval = 0
    c.auto_save.session = False
    c.session.lazy_restore = False
    c.content.cookies.accept = "all"
    c.content.autoplay = False
    c.session.default_name = None
    c.url.start_pages = ["https://start.duckduckgo.com"]
    # c.url.start_pages = ["https://www.blackoutvisuals.com"]

    # Process model & low-end mode
    # config.set("content.process_model", "process-per-site")
    config.set("qt.args", ["--enable-low-end-device-mode"])

    # Lightweight UI & features
    config.set("tabs.background", False)
    config.set("content.notifications.enabled", False)
    config.set("content.plugins", False)
    config.set("content.local_storage", False)

    # items that are wrong:
    # config.set("ui.hide_scrollbar", True)
    # config.set("ui.hide_statusbar", True)
    # config.set("ui.hide_tabbar_if_only_one_tab", True)
    # config.set("content.javascript.can_access_clipboard", False)
    # config.set("content.webrtc_ip_handling_policy", "disable_non_proxied_udp")

    # Optional extra flags
    config.set(
        "qt.args",
        [
            "--enable-low-end-device-mode",
            "--process-per-site",
            "--no-sandbox",
            "--disable-gpu-sandbox",
            "--disable-background-timer-throttling",
            "--disable-accelerated-2d-canvas",
            "--disable-accelerated-video-decode",
        ],
    )
