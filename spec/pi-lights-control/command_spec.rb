require "spec_helper"

describe PiLightsControl::Command do
  before(:each) do
    RPi::GPIO.set_warnings false
    RPi::GPIO.reset
  end

  after(:each) do
    RPi::GPIO.set_warnings false
    RPi::GPIO.reset
  end

  it "sets the default GPIO numbering scheme" do
    expect(RPi::GPIO).to receive(:set_numbering).with(:board)
    PiLightsControl::Command.new(12)
  end

  it "sets an alternate GPIO numbering scheme" do
    expect(RPi::GPIO).to receive(:set_numbering).with(:bcm)
    PiLightsControl::Command.new(12, numbering: :bcm)
  end

  it "defaults to repeat commands six times" do
    c = PiLightsControl::Command.new(12)
    expect(c.repeat_count).to be 6
  end

  it "supports custom repeat counts" do
    c = PiLightsControl::Command.new(12)
    c.repeat_count = 8
    expect(c.repeat_count).to be 8
  end

  describe "RF Commands" do
    before(:each) do
      expect_any_instance_of(PiLightsControl::Command).to(
        receive(:sleep).at_least(:once)
      )
      expect(RPi::GPIO).to receive(:set_high).at_least(:once)
      expect(RPi::GPIO).to receive(:set_low).at_least(:once)
      expect(RPi::GPIO).to receive(:setup).with(12, as: :output).once
      expect(RPi::GPIO).to receive(:clean_up).with(12).once
      @command = PiLightsControl::Command.new(12)
    end

    it "supports power on command" do
      @command.power_on
    end

    it "supports power off command" do
      @command.power_off
    end

    it "supports sync lights command" do
      @command.sync_lights
    end

    it "supports combination program command" do
      @command.program(:combination)
    end

    it "supports steady program command" do
      @command.program(:steady)
    end

    it "supports slow blink program command" do
      @command.program(:slow_blink)
    end

    it "supports fast blink program command" do
      @command.program(:fast_blink)
    end

    it "supports slow fade program command" do
      @command.program(:slow_fade)
    end

    it "supports fast fade program command" do
      @command.program(:fast_fade)
    end

    it "supports blink steady program command" do
      @command.program(:blink_steady)
    end

    it "supports step fade program command" do
      @command.program(:step_fade)
    end
  end
end
