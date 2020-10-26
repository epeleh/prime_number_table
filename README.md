# Prime number table

Simple program which takes a single number n from the user and in response displays n\*n table, such that the content of cell (a,b) is a sum of a-th and b-th prime number.
So, for example, for input `3` the output should read:

```
  4   5   7
  5   6   8
  7   8  10
```

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

    $ pnt 3
      4   5   7
      5   6   8
      7   8  10

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/epeleh/prime_number_table.
