module ExceptionHandler
  # provide more graceful 'included' method
  extend ActiveSupport::Concern

  # Define custom error subclasses - rescue catches 'StandardErrors'
  class AuthenticateError < StandardErrors; end
  class MissingToken < StandardErrors; end
  class InvalidToken < StandardErrors; end

  included do

    # define custom handlers
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::AuthenticateError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end

    # rescue_from ActiveRecord::RecordInvalid do |e|
    #   json_response({ message: e.message }, :unprocessable_entity)
    # end
  end

  private
  # JSON response with message; Status code 422 - unprocessble entity
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  # JSON response with message; Status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end

end
