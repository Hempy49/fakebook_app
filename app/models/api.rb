require 'rest_client'

class Api

  def login(username, key)
    request_headers = login_header
    request_body = login_body(username, key)
      response = RestClient.post 'https://coolpay.herokuapp.com/api/login', request_body, request_headers
    rescue RestClient::ExceptionWithResponse => exception
      response = exception.response
    response
  end

  def add_recipient(name, token)
    request_headers = recipient_header(token)
    request_body = recipient_body(name)
      response = RestClient.post 'https://coolpay.herokuapp.com/api/recipients', request_body, request_headers
    rescue RestClient::ExceptionWithResponse => exception
      response = exception.response
    response
  end

  private

  def login_header
    {
      content_type: 'application/json'
    }
  end

  def login_body(username, key)
    {
      username: username,
      apikey: key
    }.to_json
  end

  def recipient_header(token)
    {
      content_type: 'application/json',
      authorization: "Bearer #{token}"
    }
  end

  def recipient_body(name)
    {
      recipient: {
        name: name
      }
    }.to_json
  end
end
