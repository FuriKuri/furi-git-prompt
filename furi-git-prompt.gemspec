# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'furi/git/prompt/version'

Gem::Specification.new do |spec|
  spec.name          = 'furi-git-prompt'
  spec.version       = Furi::Git::Prompt::VERSION
  spec.authors       = ['Theo Pack']
  spec.email         = %w(tf.pack@googlemail.com)
  spec.description   = 'Git for git with all interesting informations'
  spec.summary       = 'Git prompt'
  spec.homepage      = 'https://github.com/FuriKuri/furi-git-prompt'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
