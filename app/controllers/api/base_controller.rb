module Api
  class BaseController < ActionController::API
    
    include ::ActionController::Serialization
    include ::ActionController::Cookies

    before_filter :cors
    after_filter  :cors_after

    rescue_from Exception do |e|
      logger.error(e.backtrace.join('\n'))
      logger.error(e.message)
      render(status: :internal_server_error, json: nil)
    end

    protected
    def cors
      if request.method == 'OPTIONS'
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Content-Type, X-Requested-With, X-Prototype-Version, Token, Set-Cookie'
        headers['Access-Control-Max-Age'] = '1728000'
        render :text => '', :content_type => 'text/plain'
        return false
      end
    end

    def cors_after
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Content-Type, X-Requested-With, X-Prototype-Version, Token, Set-Cookie'
      headers['Access-Control-Max-Age'] = '1728000'
      headers['Content-Type'] = 'application/text'
    end
    
  end
end
