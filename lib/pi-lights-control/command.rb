module PiLightsControl
  class Command
    def initialize(pin, options = {})
      RPi::GPIO.set_numbering options[:numbering] || :board
    end
  end
end
