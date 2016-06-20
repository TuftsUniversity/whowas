# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whowas/version'

Gem::Specification.new do |spec|
  spec.name          = "whowas"
  spec.version       = Whowas::VERSION
  spec.authors       = ["Jess Frisch"]
  spec.email         = ["jess.frisch@tufts.edu"]

  spec.summary       = %q{Match an IP address and timestamp to a username.}
  spec.homepage      = "https://github.com/TuftsUniversity/whowas"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "middleware"
  spec.add_dependency "splunk-sdk-ruby"
  
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
