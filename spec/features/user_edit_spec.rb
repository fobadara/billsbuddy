require 'rails_helper'

RSpec.describe 'User edit', type: :feature do
  before(:each) do
    visit user_session_path

    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: '123456')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit edit_user_registration_path(@user)
  end

  it 'should edit user' do
    fill_in 'Name', with: 'edit name'
    fill_in 'Email', with: 'bbc@mail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end

  it 'should not edit user' do
    fill_in 'Name', with: ''
    fill_in 'Email', with: ''
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''
    click_button 'Update'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  it 'should not edit user with invalid email' do
    fill_in 'Name', with: 'edit name'
    fill_in 'Email', with: 'bbcmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Update'

    expect(page).to have_content("Email is invalid")
  end

  it 'should not edit user with invalid password' do
    fill_in 'Name', with: 'edit name'
    fill_in 'Email', with: 'abc@mail.com'
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'
    click_button 'Update'

    expect(page).to have_content("Password is invalid")
  end

  it 'should not edit user with invalid password confirmation' do
    fill_in 'Name', with: 'edit name'
    fill_in 'Email', with: 'abc@mail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '12345'
    click_button 'Update'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
