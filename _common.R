# example R options set globally
options(width = 60)
options(bookdown.render.file_scope = FALSE)
# example chunk options set globally
knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  echo = TRUE
  )
knitr::opts_chunk$set(out.height = "\\textheight",  out.width = "\\textwidth",
                      out.extra = "keepaspectratio=true")
knitr::opts_chunk$set(fig.margin = TRUE)
include_svg = function(path) {
  if (knitr::is_latex_output()) {
    output = xfun::with_ext(path, 'pdf')
    # you can compare the timestamp of pdf against svg to avoid conversion if necessary
    system2('rsvg-convert', c('-f', 'pdf', '-a', '-o', shQuote(c(output, path))))
  } else {
    output = path
  }
  knitr::include_graphics(output)
}

ZERO_DEGREES_C_IN_K = 273.15

convertFromDegreesFToK <- function(temperatureF) {
  (temperatureF - 32) / 1.8 + ZERO_DEGREES_C_IN_K
}
celsius_to_kelvin = function(celsius) {
  celsius + 2.7315e2
}
TEMPERATURE_OF_FUSION_OF_ICE <- 2.7315E2

MOLAR_WEIGHT_H <- 1.008E-3
MOLAR_WEIGHT_C <- 12.011E-3
MOLAR_WEIGHT_N <- 14.007E-3
MOLAR_WEIGHT_O <- 15.999E-3

SPECIFIC_HEAT_CAPACITY_OF_WATER <- 4.0939e3
SPECIAL_HEAT_FE = .44 / (.1 ^ 3)
SPECIAL_HEAT_STEEL = 502

HEAT_OF_FUSION_OF_ICE <- 3.335E5

HEAT_VAPORIZATION_WATER = 40.65 * 10 ^ 3 / ((MOLAR_WEIGHT_H * 2 + MOLAR_WEIGHT_O) * .1 ^ 3)

RADIUS_EARTH = 6.4E6
LENGTH_EQUATOR_EARTH = RADIUS_EARTH * 2 * pi

COEFFICIENT_LINEAR_EXPANSION_FE = .000011
COEFFICIENT_LINEAR_EXPANSION_STEEL = 1.2E-5

changeSciNot <- function(n) {
  output <- format(n, scientific = TRUE) #Transforms the number into scientific notation even if small
  output <- sub("e", "\\\\times 10^", output) #Replace e with 10^
  output <- sub("\\+0?", "", output) #Remove + symbol and leading zeros on expoent, if > 1
  output <- sub("-0?", "-", output) #Leaves - symbol but removes leading zeros on expoent, if < 1
  output <- sub("(.*)", "\\$\\1\\$", output)
}

R <- 8.314472

p <- 1e5
