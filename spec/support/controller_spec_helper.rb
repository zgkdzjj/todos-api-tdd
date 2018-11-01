module ControllerSpecHelper
  # generate tokens form user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired tokens from user_id
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))    
  end

  # return valid headers
  def valid_headers
    {
      "Authorizatioin" => token_generator(user.id),
      "Content-Type" => "application/json"
    }
  end

  # return invalid headers
  def invalid_headers
    {
      "Authorizatioin" => nil,
      "Content-Type" => "application/json"
    }
  end
    
    
end
