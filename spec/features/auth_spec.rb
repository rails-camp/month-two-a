require 'rails_helper'

describe 'user login' do
  it 'allows a user to register' do
    visit new_user_registration_path

    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on 'Sign up'

    expect(page).to have_current_path(root_path)
  end

  it 'allows a user to login' do
    User.create(email: 'test2@test.com', password: 'password', password_confirmation: 'password')
    visit new_user_session_path

    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'

    click_on 'Log in'

    expect(page).to have_current_path(root_path)
  end

  it 'allows a user to sign out via a link in a bootstrap drop down menu item' do
    user = User.create(email: 'test3@test.com', password: 'password', password_confirmation: 'password')
    login_as(user, :scope => :user)

    visit root_path

    page.find(:xpath, "//a[@href='/users/sign_out']").click

    expect(page).to have_content("Signed out")
  end
end