return {
  "sphamba/smear-cursor.nvim",
  event = "VeryLazy",
  opts = {
    stiffness = 0.4,
    trailing_stiffness = 0.7,
    damping = 0.6,
    distance_stop_animating = 0.7,
    hide_target_hack = false,
    cursor_color = "#d3cdc3",
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,
    legacy_computing_symbols_support = false,
  },
}
