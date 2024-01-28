-- nord palette
local M = {}

M.colors = {
  nord0 = "#2E3440",
  nord1 = "#3B4252",
  nord2 = "#434C5E",
  nord3 = "#4C566A",
  nord3_bright = "#616E88",
  nord4 = "#D8DEE9",
  nord5 = "#E5E9F0",
  nord6 = "#ECEFF4",
  nord7 = "#8FBCBB",
  nord8 = "#88C0D0",
  nord9 = "#81A1C1",
  nord10 = "#5E81AC",
  nord11 = "#BF616A",
  nord12 = "#D08770",
  nord13 = "#EBCB8B",
  nord14 = "#A3BE8C",
  nord15 = "#B48EAD",
}

M.get_base_colors = function()
  local config = require("nord").config
  local p = M.colors

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  local colors = {
    darkest_night_0 = p.nord0,
    darker_night_1 = p.nord1,
    dark_night_2 = p.nord2,
    night_3 = p.nord3,
    bright_night_3b = p.nord3_bright,
    snow_4 = p.nord4,
    light_snow_5 = p.nord5,
    lightest_snow_6 = p.nord6,
    green_blue_7 = p.nord7,
    ice_blue_8 = p.nord8,
    arctic_blue_9 = p.nord9,
    ocean_blue_10 = p.nord10,
    red_11 = p.nord11,
    orange_12 = p.nord12,
    yellow_13 = p.nord13,
    green_14 = p.nord14,
    plum_15 = p.nord15,
  }

  return colors
end

return M

