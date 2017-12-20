# app/commands/authorize_api_request.rb

class AuthorizeApiRequest
  prepend SimpleCommand

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token["user_id"]) if decoded_auth_token
    @user || (errors.blank? ? errors.add(:token, 'Invalid token') : errors) && nil
  end

  def decoded_auth_token
    begin
      @decoded_auth_token ||= JWT.decode http_auth_header, ENV["HMAC_SECRET"], true, { :algorithm => 'HS512' }
      @decoded_auth_token .first
    rescue JWT::ExpiredSignature
      errors.add(:token, 'Expired token')
    end
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else errors.add(:token, 'Missing token')
    end
    nil
  end
end
