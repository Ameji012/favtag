module Api
  module V1
    class TweetsController < BaseController
      
      def index
        return render(status: :ok, json: Tweet.all)
      end

      def search
        return render(status: :ok, json: nil)
      end

    end
  end
end
