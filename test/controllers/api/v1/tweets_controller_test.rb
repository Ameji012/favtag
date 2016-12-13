require 'test_helper'
module Api
  module V1

    class TweetsControllerTest < ActionController::TestCase

      test "should return a list of tweets based on the provided hashtag" do
        post :search, { hashtag: 'trump' }
        assert_response :success
      end
    end

  end
end