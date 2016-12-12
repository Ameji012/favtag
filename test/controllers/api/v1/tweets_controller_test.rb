require 'test_helper'
module Api
  module V1

    class TweetsControllerTest < ActionController::TestCase
      test "should return object list of tweets" do
        get :index
        assert_response :success
      end

      test "should return object list of tweets based on the provided hashtag" do
        post :search, params: { hashtag: 'trump' }
        assert_response :success
      end
    end

  end
end