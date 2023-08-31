class ApplicationController < ActionController::API
  include ActionController::Cookies
  include UserAuthenticateService

  # CSRF対策
  before_action :xhr_request?

  private

    # XMLHttpRequestでない場合403エラーを返す
    def xhr_request?
      # リクエストヘッダ X-Requested-With: 'XMLHttpRequest' の存在を判定
      return if request.xhr?

      render status: :forbidden, json: { status: 403, error: "Forbidden" }
    end

    # Internal Server Error
    def response_500_error(msg = "Internal Server Error")
      render status: :internal_server_error, json: { status: 500, error: msg }
    end
end
