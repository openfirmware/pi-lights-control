require 'rpi_gpio'

require "pi-lights-control/command"
require "pi-lights-control/version"

module PiLightsControl
  CODE_TABLE = {
    0 => [4, 4],
    1 => [4, 8],
    2 => [4, 71],
    3 => [26, 12]
  }
  COMMAND_TABLE = {
    power_off: [3,0,1,0,1,1,0,0,1,1,1,0,1,0,0,0,1,2],
    power_on: [3,0,1,0,1,1,0,0,1,1,1,0,1,0,0,0,0,2]
  }
  TIME_DELAY = 120 # microseconds
end
