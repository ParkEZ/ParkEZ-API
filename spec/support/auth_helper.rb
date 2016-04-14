module AuthHelper
  def auth_request(user)
    sign_in user
    request.headers.merge!(user.create_new_auth_token)
  end

  def auth_headers(user)
    user_headers = user.create_new_auth_token
    @request.headers.merge!(user_headers)
  end
end
