module Api
  module V1
    class SearchesController < BaseController
      before_filter :set_client, only: [:search]
      
      def index

        return render(status: :ok, json: Search.all.joins(:tweets).group( 'searches.id' ))
      end

      def show
        
        return render(status: :ok, json: Search.find(params[:id]).tweets)
      end

    end
  end
end
