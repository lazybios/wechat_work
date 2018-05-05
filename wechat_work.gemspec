
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wechat_work/version"

Gem::Specification.new do |spec|
  spec.name          = "wechat_work"
  spec.version       = WechatWork::VERSION
  spec.authors       = ["lazybios"]
  spec.email         = ["lazybios@gmail.com"]

  spec.summary       = "api tools for wechat work"
  spec.description   = "api tools for wechat work"
  spec.homepage      = "https://github.com/lazybios/wechat_work"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0"

  spec.add_dependency "rest-client", "~> 2.0"

  spec.required_ruby_version = '>= 2.0.0'
end
