feature 'Authentication' do
  scenario 'authenticates successfully' do
    visit '/'
    click_button 'Authenticate'
    expect(page).to have_content 'Authentication successful'
  end
end
