
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
