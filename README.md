# Fakebook App

## Scenario
 
Coolpay is a new company that allows to easily send money to friends through their API.
 
You work for Fakebook, a successful social network. You’ve been tasked to integrate Coolpay inside Fakebook. A/B tests show that users prefer to receive money than pokes!
 
You can find Coolpay documentation here: http://docs.coolpayapi.apiary.io/
 
Write a small app that uses Coolplay API in Ruby. The app should be able do the following:
 
- Authenticate to Coolpay API
- Add recipients
- Send them money
- Check whether a payment was successful

## How to use

`$ git clone https://github.com/Hempy49/fakebook_app.git`  
`$ cd fakebook_app`  
`$ bundle`  
`$ touch .env`
open `.env` and write:
```
API_USER='replace-with-your-username'
API_KEY='replace-with-your-key'
```   
Launch the app with `rackup`  
Run the tests with `rspec -fd`

## Next steps

- Refactoring: the app controller is quite large and with more time I would like to divide this out into separate controllers for each route e.g. recipients, payments etc. The Api model also seems to have more than one responsibility and could benefit from being separated out into different models.

- Tests: with more time I would like to increase test coverage for edge cases and improve doubling in unit tests.  

- The app could be improved by allowing users to input their coolpay username and key through the UI, rather than having to enter in the .env file currently. 

- Styling: very basic currently. The UI could be made more interactive and exciting. 
