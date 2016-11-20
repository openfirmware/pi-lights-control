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
end
