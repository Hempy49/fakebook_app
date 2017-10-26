feature 'Send payment' do
  scenario 'sends money to recipient successfully' do
    login
    add_new_recipient(name = 'Jack')
    send_payment
    expect(page).to have_content 'Payment sent successfully'
  end
end
