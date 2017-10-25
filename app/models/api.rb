require 'rest_client'

class Api

  def authenticate(username, key)
    headers = request_header
    body = request_body(username, key)
    begin
    response = RestClient.post 'https://coolpay.herokuapp.com/api/login', body, headers
    rescue RestClient::ExceptionWithResponse => exc
      response = exc.response
    end
    response
  end

  private

  def request_header
    {
      :content_type => 'application/json'
    }
  end

  def request_body(username, key)
    {
      username: username,
      apikey: key
    }.to_json
  end
end
