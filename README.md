# Whowas

[![Code Climate](https://codeclimate.com/github/TuftsUniversity/whowas/badges/gpa.svg)](https://codeclimate.com/github/TuftsUniversity/whowas) [![Test Coverage](https://codeclimate.com/github/TuftsUniversity/whowas/badges/coverage.svg)](https://codeclimate.com/github/TuftsUniversity/whowas/coverage) [![Build Status](https://travis-ci.org/TuftsUniversity/whowas.svg?branch=master)](https://travis-ci.org/TuftsUniversity/whowas) [![Dependency Status](https://gemnasium.com/TuftsUniversity/whowas.svg)](https://gemnasium.com/TuftsUniversity/whowas)

## Description

Whowas is a simple tool for chaining third-party API searches together.  It is called "Whowas" because it was initially developed to answer the question, "Who was the person (username) using this IP address at that time?"

Whowas can be used to match any piece of data with another through an arbitrary number of API searches, where the result of each search becomes the input to the next search.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whowas'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whowas

## Usage

Please see the [wiki](https://github.com/TuftsUniversity/whowas/wiki) for basic usage and other documentation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/whowas.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

