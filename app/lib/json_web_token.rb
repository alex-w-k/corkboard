class JsonWebToken
  def self.encode(payload, exp = 1.hour.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, ENV['JWT_KEY_BASE'])
  end

  def self.decode(token)
    body = JWT.decode(token, ENV['JWT_KEY_BASE'])
    ActiveSupport::HashWithIndifferentAccess.new(body[0])
  end
end