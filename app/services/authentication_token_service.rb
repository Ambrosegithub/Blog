class AuthenticationTokenService
  HMAC_SECRET = 'my$ecretK3y'.freeze
  def self.call(id)
    payload = { user_id: id }
    JWT.encode payload, HMAC_SECRET, 'HS256'
  end
end
