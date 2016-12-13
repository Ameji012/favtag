module Api
  module V1
    class TweetsController < BaseController
      before_filter :set_client, only: [:search]
    
      def search
        
        if !params['hashtag']
          return render(status: :bad_request, json: nil)
        end
        search = Search.create(query: params['hashtag'])
        ap search.query
        @client.search('#' + search.query, result_type: "popular").sort_by(&:favorite_count).reverse.take(5).collect.each do |tweet|
          t = Tweet.create(
            search_id: search.id,
            screen_name: tweet.user.screen_name,
            text: tweet.text, 
            retweet_count: tweet.retweet_count, 
            favorite_count: tweet.favorite_count,
            url: tweet.url
            )
          ap t
        end

        return render(status: :ok, json: search.tweets)
      end

      private
      def set_client
        
        @client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["CONSUMER_KEY"]
          config.consumer_secret     = ENV["CONSUMER_SECRET"]
          config.access_token        = ENV["ACCESS_TOKEN"]
          config.access_token_secret = ENV["ACCESS_SECRET"]
        end          
      end

    end
  end
end
