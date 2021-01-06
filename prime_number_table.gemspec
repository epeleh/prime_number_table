# frozen_string_literal: true

require_relative 'lib/prime_number_table/version'

Gem::Specification.new do |spec|
  spec.name          = 'prime_number_table'
  spec.version       = PrimeNumberTable::VERSION
  spec.authors       = ['Evgeny Peleh']
  spec.email         = ['pelehev@gmail.com']

  spec.homepage      = 'https://github.com/epeleh/prime_number_table'
  spec.summary       = 'CLI application'
  spec.description   = 'Displays a table of numbers.'
  spec.license       = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= ' + File.read('.ruby-version').strip)

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables << 'pnt'
end
