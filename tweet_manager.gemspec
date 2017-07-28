# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tweet_manager/version'

Gem::Specification.new do |spec|
  spec.name          = 'tweet_manager'
  spec.version       = TweetManager::VERSION
  spec.authors       = ['jotase']
  spec.email         = ['jota.segovia@gmail.com']

  spec.summary       = 'Twitter bot that tweet content from different sources'
  spec.description   = 'Twitter bot that tweet content from different sources, ATM Medium posts and youtube videos'
  spec.homepage      = 'https://github.com/5rabbits/tweet_manager'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'byebug'

  spec.add_dependency 'mechanize'
  spec.add_dependency 'yt'
end
