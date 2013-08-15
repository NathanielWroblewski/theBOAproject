require 'spec_helper'

feature 'New users' do
  it 'can sign up' do
    visit root_path
    fill_in 'user_username', with: 'new_user'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create User'

    user = User.find_by_username('new_user')
    expect(page).to have_content 'Signed up!'
    expect(user).to be
    expect(user.username).to eq 'new_user'
    expect(user.email).to eq 'test@test.com'
    expect(user.authenticate('password')).to be_true
    expect(current_url).to match(positions_path)
  end

  it 'cannot sign up without a password' do
    visit root_path
    fill_in 'user_username', with: 'new_user'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create User'

    user = User.find_by_username('new_user')
    expect(page).to have_content 'Fields cannot be blank.'
    expect(current_url).to_not include(positions_path)
    expect(user).to_not be
  end

  it 'cannot sign up without a password confirmation' do
    visit root_path
    fill_in 'user_username', with: 'new_user'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    click_button 'Create User'

    user = User.find_by_username('new_user')
    expect(page).to have_content 'Fields cannot be blank.'
    expect(current_url).to_not include(positions_path)
    expect(user).to_not be
  end

  it 'cannot sign up without an email' do
    visit root_path
    fill_in 'user_username', with: 'new_user'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create User'

    user = User.find_by_username('new_user')
    expect(page).to have_content 'Fields cannot be blank.'
    expect(current_url).to_not include(positions_path)
    expect(user).to_not be
  end

  it 'cannot sign up without a username' do
    visit root_path
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Create User'

    user = User.find_by_username('new_user')
    expect(page).to have_content 'Fields cannot be blank.'
    expect(current_url).to_not include(positions_path)
    expect(user).to_not be
  end
end

feature 'Existing users' do
  it 'can log in' do
    user = create(:user, email: 'test@test.com', password: 'password')

    visit root_path
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    click_button 'Log In'

    expect(page).to have_content 'Logged in.'
    expect(current_url).to include(positions_path)
  end

  it 'cannot log in without an email' do
    user = create(:user, email: 'test@test.com', password: 'password')

    visit root_path
    fill_in 'password', with: 'password'
    click_button 'Log In'

    expect(page).to have_content 'Invalid email or password.'
    expect(current_url).to_not include(positions_path)
  end

  it 'cannot log in without a password' do
    user = create(:user, email: 'test@test.com', password: 'password')

    visit root_path
    fill_in 'email', with: 'test@test.com'
    click_button 'Log In'

    expect(page).to have_content 'Invalid email or password.'
    expect(current_url).to_not include(positions_path)
  end
end
