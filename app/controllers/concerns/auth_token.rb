require 'jwt'

module AuthToken
  attr_accessor :expiration_time

  def expiration_time
    @expiration_time || 1.day
  end

  def issue_token payload
    JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
  end

  def validate_token token
    JWT.decode token, Rails.application.secrets.secret_key_base
  end
end