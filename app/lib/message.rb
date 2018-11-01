class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found"
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

end