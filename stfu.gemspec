
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stfu'

Gem::Specification.new do |spec|
  spec.name          = "stfu"
  spec.version       = Stfu::VERSION
  spec.authors       = ["cbrnrd"]
  spec.email         = ["cbawsome77@gmail.com"]

  spec.summary       = %q{Easy suppression of stdout and, optionally, stderr}
  spec.homepage      = "https://github.com/cbrnrd/stfu"


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
