module PiLightsControl
  class Command
    attr_accessor :repeat_count

    def initialize(pin, options = {})
      RPi::GPIO.set_numbering options[:numbering] || :board
      @repeat_count = 6
      @pin = pin
    end

    def power_off
      transmit_command(PiLightsControl::COMMAND_TABLE[:power_off])
    end

    def power_on
      transmit_command(PiLightsControl::COMMAND_TABLE[:power_on])
    end

    def program(name)
      program_name = "program_#{name.to_s}"
      transmit_command(PiLightsControl::COMMAND_TABLE[program_name.to_sym])
    end

    def sync_lights
      transmit_command(PiLightsControl::COMMAND_TABLE[:sync_lights])
    end

    private

    def transmit_command(command)
      @repeat_count.times do
        command.each do |code|
          high_length = PiLightsControl::CODE_TABLE[code][0]
          low_length = PiLightsControl::CODE_TABLE[code][1]

          RPi::GPIO.set_high @pin
          sleep(high_length * PiLightsControl::TIME_DELAY / 1000000.0)

          RPi::GPIO.set_low @pin
          sleep(low_length * PiLightsControl::TIME_DELAY / 1000000.0)
        end
      end
    end
  end
end
