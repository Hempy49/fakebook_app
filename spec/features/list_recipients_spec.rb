feature 'Lists recipients' do
  scenario 'lists all added recipients' do
    login
    add_new_recipient(name = 'John')
    visit '/recipients'
    expect(page).to have_content 'John'
  end
end
