require_relative "lib/lab42/diggy_methods/version"
version = Lab42::DiggyMethods::VERSION

description = <<~DESCRIPTION
  Create an instance of me with a Hash and access the (nested) values
  by method chaining.

  Especially usueful when passing my binding into `ERB.new(...).result`
DESCRIPTION

Gem::Specification.new do |s|
  s.name        = 'lab42_diggy_methods'
  s.version     = version
  s.summary     = 'Accessing hash (nested) values by method chaining'
  s.description = description
  s.authors     = ["Robert Dober"]
  s.email       = 'robert.dober@gmail.com'
  s.files       = Dir.glob("lib/**/*.rb")
  s.files      += %w[LICENSE README.md]
  s.homepage    = "https://github.com/robertdober/lab42_diggy_methods"
  s.licenses    = %w[Apache-2.0]

  s.required_ruby_version = '>= 3.1.0'
end
