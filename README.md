# Prime number table

Displays a table of numbers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'prime_number_table'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install prime_number_table

## Usage

    $ pnt
    => Please give matrix dimension (<width>x<height>)
    -> 5x4
    => Should I use (P)rime numbers or (F)ibonacci numbers?
    -> F
    => Multiplication (*) or Addition (+)
    -> M

      1   1   2   3   5
      1   1   2   3   5
      2   2   4   6  10
      3   3   6   9  15

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/epeleh/prime_number_table.
