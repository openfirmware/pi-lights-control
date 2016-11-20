module PiLightsControl
  class Command
    attr_accessor :repeat_count

    def initialize(pin, options = {})
      RPi::GPIO.set_numbering options[:numbering] || :board
      @repeat_count = 6
    end
  end
end
