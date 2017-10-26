require 'spec_helper'

describe Api do
  subject(:api) { described_class.new }

  it { is_expected.to be }

  describe '#login' do
    it 'authenticates correct username and key' do
      response = '{"token": "aff06fec-e041-4994-849e-223f0569e0bc"}'
      stub_request(:post, "https://coolpay.herokuapp.com/api/login").
      with(:body => "{\"username\":\"Simon\",\"apikey\":\"secrectKey\"}",
        :headers => {"Content-Type"=> "application/json"}).
        to_return(:status => 201, :body => response)
        authentication = api.login('Simon', 'secrectKey')
        json = JSON.parse(authentication.body)
        expect(json['token']).to eq "aff06fec-e041-4994-849e-223f0569e0bc"
    end

    it 'responds with error for incorrect username and key' do
      response = api.login("Incorrect", "Incorrect")
      expect(response).to include 'Internal server error'
    end
  end

  describe '#add_recipient' do
    it 'adds a recipient successfully' do
      response = '{"recipient":{"id":"49b04854-5edf-501f-9893-a6f220c259c4","name":"Sam"}}'
      stub_request(:post, "https://coolpay.herokuapp.com/api/recipients").
      with(:body => "{\"recipient\":{\"name\":\"Sam\"}}",
        :headers => {"Content-Type"=> "application/json"}).
        to_return(:status => 201, :body => response)
        recipient = api.add_recipient('Sam', 'e1234567-1234-1234')
        json = JSON.parse(recipient.body)
        expect(json['recipient']['name']).to eq 'Sam'
      end
    end

    describe "#send_payment" do
      it "sends money to recipient successfully" do
        response = '{"payment":{"id":"49b04854-5edf-501f-9893-a6f220c259c4","amount":"10","currency":"GBP","recipient_id":"6e7b146e-5957-11e6-8b77-86f30ca893d3","status":"processing"}}'
        stub_request(:post, "https://coolpay.herokuapp.com/api/payments").
        with(:body => "{\"payment\":{\"amount\":10,\"currency\":\"GBP\",\"recipient_id\":\"6e7b146e-5957-11e6-8b77-86f30ca893d3\"}}",
          :headers => {"Content-Type"=> "application/json"}).
          to_return(:status => 201, :body => response)
          payment = api.send_payment(10,"6e7b146e-5957-11e6-8b77-86f30ca893d3","49b04854-5edf-501f-9893-a6f220c259c4")
          json = JSON.parse(payment.body)
          expect(json['payment']['amount']).to eq '10'
          expect(json['payment']['recipient_id']).to eq '6e7b146e-5957-11e6-8b77-86f30ca893d3'
          expect(json['payment']['status']).to eq 'processing'
        end
      end
    end
