# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "verbose-shell/version"

Gem::Specification.new do |spec|
  spec.name          = "verbose-shell"
  spec.version       = VerboseShell::VERSION
  spec.authors       = ["David Caldwell"]
  spec.email         = ["david@porkrind.org"]

  spec.summary       = %q{sh -x like logging of FileUtils functions.}
  spec.description   = %q{sh -x like logging of FileUtils functions.}
  spec.homepage      = 'https://github.com/caldwell/verbose-shell'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'pastel', '~> 0.7.2'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
end
