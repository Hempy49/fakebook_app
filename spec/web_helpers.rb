def login
  visit '/'
  click_button 'Login'
end

def add_new_recipient(name = 'Simon')
  click_button 'Add recipient'
  fill_in :name, with: name
  click_button 'Submit'
end

def send_payment
  visit '/recipients'
  click_button('Send payment', match: :first)
  fill_in :amount, with: 10
  click_button 'Submit'
end
