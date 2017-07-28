# TweetManager

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tweet_manager`. To experiment with that code, run `bin/console` for an interactive prompt.

Gem for automatize tweets using our content's source, like YouTube and Medium

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tweet_manager'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tweet_manager

## Usage

```ruby

# define twitter credentials  https://apps.twitter.com/
credentials = {
  consumer_key: ENV['CONSUMER_KEY'],
  consumer_secret: ENV['CONSUMER_SECRET'],
  access_token: ENV['ACCESS_TOKEN'],
  access_token_secret: ENV['ACCESS_TOKEN_SECRET']
}

# define youtube developer key https://console.developers.google.com/
youtube_api_key = ENV['YOUTUBE_KEY']

# instance a tweet class
tweet = TweetManager::Tweet.new(credentials, youtube_api_key)

# Youtube content

# define the channel id
channel_id = 'UCVbaQ_GvmiOapfn2GOyBiLQ' # 5rabbits's channel

# Tweet last youtube video from a channel
tweet.action(service: 'youtube', type: 'last', target: channel_id)

# Tweet random youtube video from a channel
tweet.action(service: 'youtube', type: 'random', target: channel_id)

# if you wanna add extra content to your tweet as mentions or whatever you want
# add an 'extra' argument as array
tweet.action(service: 'youtube', type: 'random', target: channel_id, extra: ['@5rabbitHQ', 'Check this out!'])

# Medium contentn
# Define a medium user
medium_user = '@_jotase'

# or a custom domain for medium
blog = 'blog.5rabbits.com'

# Tweet last story from a user
tweet.action(service: 'medium', type: 'last', target: medium_user)

# Tweet last story from a custom domain
tweet.action(service: 'medium', type: 'last', target: blog)

# Tweet random story from a user
tweet.action(service: 'medium', type: 'random', target: medium_user)

# Tweet random story from a custom domain
tweet.action(service: 'medium', type: 'random', target: blog)

# if you wanna add extra content to your tweet as mentions or whatever you want
# as before, add an 'extra' argument as array
tweet.action(service: 'medium', type: 'random', target: blog, extra: ['@5rabbitHQ', 'Check this out!'])

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/5rabbits/tweet_manager. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

