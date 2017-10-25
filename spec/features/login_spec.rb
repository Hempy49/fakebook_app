feature 'Login' do
  scenario 'logs in successfully' do
    login
    expect(page).to have_content 'Login successful'
  end
end
