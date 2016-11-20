# Pi Lights Control

This gem provides an executable and a library for sending radio frequency commands from a Raspberry Pi connected with a 433.920 MHz transmitter to one or more sets of Home Collection Remote Control Christmas Lights.

The gem should be compatible with any Raspberry Pi that has GPIO pins. It has been tested with a 433.920 MHz FS1000A module (pictured below) for Arduino/Raspberry Pi compatible devices. It **will not** build on MacOS as epoll is only supported on Linux.

![FS1000A Receiver/Transmitter Set](https://www.jamesbadger.ca/images/FS1000A.jpg)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pi-lights-control'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pi-lights-control

## Usage

You can use this gem in two ways, as a Ruby library or as an executable.

### Executable Usage

Using the executable from the command line allows you to quickly test the library.

TODO

### Library API

Alternatively, you can build applications that integrate this library.

#### Command Class

The `Command` class sets up a single GPIO pin as the output control for a transmitter. It is initialized with the Pin number (defaulting to board numbering). It also supports BCM pin numbering.

```ruby
c = PiLightsControl::Command.new(12) # => :board numbering
c = PiLightsControl::Command.new(10, { numbering: :bcm }) # => :bcm numbering
```

The `Command` class will default to repeating codes six times, as that was a reliable count used in testing. You can however change it:

```ruby
c = PiLightsControl::Command.new(12)
c.repeat_count = 8
```

Turning the lights on or off can be accessed using simple commands:

```ruby
c = PiLightsControl::Command.new(12)
c.power_on
c.power_off
```

Synchronizing lights will cause any light sets that receive the command to reset to a default state, ensuring all lights are in a "fresh slate".

```ruby
c = PiLightsControl::Command.new(12)
c.sync_lights
```

There are eight different programs that can be configured for the lights.

```ruby
c = PiLightsControl::Command.new(12)
c.program(:combination) # Cycles through the other 7 programs
c.program(:steady) # Lights are continuously on
c.program(:slow_blink) # Lights are on 1/2 second, then off 1/2 second
c.program(:fast_blink) # Lights blink on/off much faster
c.program(:slow_fade) # Lights fade from off to on at a slow rate
c.program(:fast_fade) # Lights fade from off to on at a fast rate
c.program(:blink_steady) # Lights blink twice, then are steady for a second or two
c.program(:step_fade) # Lights fade from off to on but at discrete brightness steps instead of a continuous increase/decrease
```

## Roadmap

For v0.1.0:

* Support power on/off for lights
* Support all light programs and sync

For v0.2.0:

* Add executable

For v0.3.0:

* Any cleanup/refactoring before v1.0

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pi-lights-control. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

