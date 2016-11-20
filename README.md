# Pi Lights Control

This gem provides an executable and a library for sending radio frequency commands from a Raspberry Pi connected with a 433.920 MHz transmitter to one or more sets of Home Collection Remote Control Christmas Lights.

The gem should be compatible with any Raspberry Pi that has GPIO pins. It has been tested with a 433.920 MHz FS1000A module (pictured below) for Arduino/Raspberry Pi compatible devices.

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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pi-lights-control. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
