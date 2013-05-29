require 'net/http'
require 'uri'
require 'json'

def get_tweets(params)
  url     = "http://search.twitter.com/search.json#{params}"
  request = Net::HTTP.get_response(URI.parse(URI.encode(url)))
  data    = JSON.parse(request.body)

  File.open('texts.txt', 'a') do |file|
    file.write @string
    data['results'].each do |tweet| 
      msg = tweet['text'].gsub('\n', '')
      file.puts msg if msg != ''
    end
  end

  puts url

  get_tweets(data['next_page']) if data['next_page']
end

get_tweets('?page=1&q=bill')
