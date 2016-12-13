require 'test_helper'
module Api
  module V1

    class SearchesControllerTest < ActionController::TestCase

      test "should return object list of searches" do
        get :index
        assert_response :success
      end

      test "should return a list of tweets" do
        search = Search.create(query: 'trump')
        get :show, {id: search.id}
        assert_response :success
      end
    end

  end
end