# Sinatra::ErrorLogger

[![Build Status](https://travis-ci.org/vinted/sinatra-error-logger.svg)](https://travis-ci.org/vinted/sinatra-error-logger)

Logs errors from Sinatra app to specified logger.

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra-error-logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-error-logger

## Usage

Configure your logger first and add `use Sinatra::ErrorLogger, logger` to your Sinatra webapp.

## Contributing

1. Fork it ( https://github.com/vinted/sinatra-error-logger/fork )
2. Create your feature branch (`git checkout -b features/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin features/my-new-feature`)
5. Create a new Pull Request
