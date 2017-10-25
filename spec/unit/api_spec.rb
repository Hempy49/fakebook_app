require 'spec_helper'
require 'dotenv'
Dotenv.load

API_KEY = ENV['API_KEY']
API_USER = ENV['API_USER']

describe Api do
  subject(:api) { described_class.new }

  it { is_expected.to be }

  describe '#authenticate' do
    it 'authenticates correct username and key' do
      response = api.authenticate(API_USER, API_KEY)
      expect(response).to include 'token'
    end

    it 'responds with error for incorrect username and key' do
      response = api.authenticate("Incorrect", "Incorrect")
      expect(response).to include 'Internal server error'
    end
  end
end
