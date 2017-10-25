feature 'Add new recipient' do
  scenario 'adds recipient successfully' do
    login
    add_new_recipient
    expect(page).to have_content 'Simon'
  end
end
