require 'rails_helper'

RSpec.describe AuthenticateUser do 
  # create test user
  let(:user) { create(:user) } 
  # valid request subject
  subject(:valid_request_obj) { described_class.new(user.email, user.password) }
  # invalid request subject
  subject(:invalid_request_obj) { described_class.new('foo', 'bar') }

  # test suite for AuthenticateUser#Call
  describe '#call' do
    # return token when valid request
    context 'when valid credentials' do
      it 'returns an auth token' do
        token = valid_request_obj.call
        expect(token).not_to be_nil
      end
    end

    # raise Authenticate Error when invalid request
    context 'when invalid credentials' do
      it 'raise an authenticate error' do
        expect { invalid_request_obj.call }
          .to raise_error(ExceptionHandler::AuthenticationError,/Invalid credentials/)
      end
    end
  end 
end
