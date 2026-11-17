local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 13
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

local bg_path

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_domain = "WSL:kali-linux"
	config.default_cwd = "/home/maxx"

	bg_path = "C:/Users/maxx/Documents/background_images/Hawaiii.jpg"
end

if wezterm.target_triple:find("darwin") then
	bg_path = "/Users/maxx/Documents/background_images/Hawaiii.jpg"
end

if bg_path then
	config.background = {
		{
			source = { File = bg_path },
			opacity = 1,
			width = "100%",
			hsb = {
				brightness = 0.15,
			},
		},
	}
end

return config
