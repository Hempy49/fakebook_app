def login
  visit '/'
  click_button 'Login'
end

def add_new_recipient(name = 'Simon')
  click_button 'Add recipient'
  fill_in :name, with: name
  click_button 'Submit'
end
