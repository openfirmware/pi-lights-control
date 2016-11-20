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
    c = PiLightsControl::Command.new(0)
  end

  it "sets an alternate GPIO numbering scheme" do
    expect(RPi::GPIO).to receive(:set_numbering).with(:bcm)
    c = PiLightsControl::Command.new(0, { numbering: :bcm })
  end

  it "defaults to repeat commands six times" do
    c = PiLightsControl::Command.new(0)
    expect(c.repeat_count).to be 6
  end

  it "supports custom repeat counts" do
    c = PiLightsControl::Command.new(0)
    c.repeat_count = 8
    expect(c.repeat_count).to be 8
  end

  it "supports power on command" do
    expect(RPi::GPIO).to receive(:set_high).at_least(:once)
    expect(RPi::GPIO).to receive(:set_low).at_least(:once)
    c = PiLightsControl::Command.new(0)
    c.power_on
  end

  it "supports power off command" do
    expect(RPi::GPIO).to receive(:set_high).at_least(:once)
    expect(RPi::GPIO).to receive(:set_low).at_least(:once)
    c = PiLightsControl::Command.new(0)
    c.power_off
  end
end
