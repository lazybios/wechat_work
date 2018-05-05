# WechatWork

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/wechat_work`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wechat_work'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wechat_work

## Usage

```ruby
require 'wechat_work'

WechatWork.configure do |config|
  config.corpid = 'your-corpid'
  config.agentid = 'your-agentid'
  config.agentsecret = 'your-agentsecret'
end

w = WechatWork::Wechat.new
w.send_text_message('content', 'users id')
```

+ content 为消息正文，支持`<a>`标签
+ users id 支持传入用户id数组，其中特殊值`@all`为发送消息给所有人


## Todo
- [x] send text message
- [ ] command line tool
- [ ] split wechat_work.rb
- [ ] test

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wechat_work. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WechatWork project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wechat_work/blob/master/CODE_OF_CONDUCT.md).
