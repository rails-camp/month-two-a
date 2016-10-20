require 'rails_helper'

describe 'user login' do
  it 'allows a user to register' do
    visit new_user_registration_path

    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on 'Sign up'

    expect(page).to have_current_path(static_home_path)
  end

  it 'allows a user to login' do
    User.create(email: 'test2@test.com', password: 'password', password_confirmation: 'password')
    visit new_user_session_path

    fill_in 'user[email]', with: 'test2@test.com'
    fill_in 'user[password]', with: 'password'

    click_on 'Sign in'

    expect(page).to have_current_path(static_home_path)
  end

  it 'allows a user to sign out via a link in a bootstrap drop down menu item', js: true do
    user = User.create(email: 'test3@test.com', password: 'password', password_confirmation: 'password')
    login_at(user, :scope => :user)

    visit static_home_path

    click_link "Welcome #{current_user.first_name} #{current_user.last_name}"
    click_link 'sub link'

    expect(page).to have_content("signed out")
  end
end
