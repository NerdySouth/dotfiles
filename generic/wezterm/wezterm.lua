return {
  color_scheme = "Guezwhoz",

  colors = {
    background = 'transparent',
  },

  unix_domains = {
    {
      name = 'unix',
    },
  },

  -- This causes `wezterm` to act as though it was started as
  -- `wezterm connect unix` by default, connecting to the unix
  -- domain on startup.
  -- If you prefer to connect manually, leave out this line.
  default_gui_startup_args = { 'connect', 'unix' },
}

