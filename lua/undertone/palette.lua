-- Four variants, each a grayscale ramp from bg to bright plus five
-- muted accents and three semantic colors. The dark variants share
-- their accents; paper gets darker ones to hold up on a pale background.

local dark_accents = {
  peach = '#F5C49C',
  clay = '#DCA978',
  blue = '#A5B8CC',
  purple = '#BCA8C9',
  teal = '#9CC4B2',

  success = '#8AAF8F',
  warning = '#F2E3A8',
  error = '#E98D7E',
}

local light_accents = {
  peach = '#B0703C',
  clay = '#9A6233',
  blue = '#5A6E8C',
  purple = '#80648E',
  teal = '#477A6E',

  success = '#4E7A58',
  warning = '#A8842E',
  error = '#B5524A',
}

local function variant(accents, grays)
  local p = { none = 'none' }
  for k, v in pairs(accents) do
    p[k] = v
  end
  for k, v in pairs(grays) do
    p[k] = v
  end
  return p
end

return {
  -- warm near-black
  default = variant(dark_accents, {
    bg = '#0A0807',
    surface = '#181513',
    overlay = '#332F2B',
    faint = '#544E48',
    muted = '#6E6760',
    subtle = '#ADA399',
    fg = '#D8D0C6',
    bright = '#FAF5EE',
  }),

  -- pure black
  ink = variant(dark_accents, {
    bg = '#000000',
    surface = '#131110',
    overlay = '#2D2925',
    faint = '#504A44',
    muted = '#6E6760',
    subtle = '#ADA399',
    fg = '#D8D0C6',
    bright = '#FAF5EE',
  }),

  -- slightly lifted background
  smoke = variant(dark_accents, {
    bg = '#15120F',
    surface = '#23201C',
    overlay = '#3D3834',
    faint = '#5F5851',
    muted = '#797168',
    subtle = '#B2A89E',
    fg = '#DCD5CB',
    bright = '#FBF7F1',
  }),

  -- warm paper
  paper = variant(light_accents, {
    bg = '#F6F1E9',
    surface = '#ECE5DA',
    overlay = '#D8CFC2',
    faint = '#A39989',
    muted = '#80766A',
    subtle = '#5F564A',
    fg = '#403930',
    bright = '#1A1611',
  }),
}
