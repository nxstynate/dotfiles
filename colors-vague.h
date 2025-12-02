/* Vague theme port for st using your full palette */

static const char *colorname[] = {
	/* 0–7: normal */
	[0]  = "#121212", /* black      - gunmetal_black */
	[1]  = "#d8647e", /* red        - love */
	[2]  = "#6e94b2", /* green      - pine */
	[3]  = "#e0a363", /* yellow     - gold */
	[4]  = "#aeaed1", /* blue       - foam */
	[5]  = "#bb9dbd", /* magenta    - iris */
	[6]  = "#c48282", /* cyan-ish   - rose */
	[7]  = "#cdcdcd", /* white      - text */

	/* 8–15: bright */
	[8]  = "#6e6a86", /* bright black   - muted */
	[9]  = "#d8647e", /* bright red     - love (same, but fine) */
	[10] = "#6e94b2", /* bright green   - pine (again, consistent) */
	[11] = "#e0a363", /* bright yellow  - gold */
	[12] = "#aeaed1", /* bright blue    - foam */
	[13] = "#bb9dbd", /* bright magenta - iris */
	[14] = "#c48282", /* bright cyan    - rose */
	[15] = "#ffffff", /* bright white   - hard white for contrast */

	/* Extra slots used by st for bg/fg/selection/cursor if you want */
	[256] = "#121212", /* background        - gunmetal_black */
	[257] = "#cdcdcd", /* foreground        - text */
	[258] = "#2a283e", /* selection bg      - highlight_low */
	[259] = "#cdcdcd", /* selection fg      - text */
	[260] = "#44415a", /* extra highlight   - highlight_med */
	[261] = "#56526e", /* extra highlight   - highlight_high */
	[262] = "#252530", /* base (for other uses if patched) */
	[263] = "#2a273f", /* surface */
	[264] = "#393552", /* overlay */
	[265] = "#908caa", /* subtle */
};
