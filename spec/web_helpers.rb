def login
  visit '/'
  click_button 'Login'
end

def add_new_recipient
  click_button 'Add recipient'
  fill_in :name, with: 'Simon'
  click_button 'Submit'
end
