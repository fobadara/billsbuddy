require 'rails_helper'

RSpec.describe 'Group new', type: :feature do
  before(:each) do
    visit user_session_path

    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: 'foobar')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit new_group_path
  end

  it 'should add new group' do
    fill_in 'Name', with: 'Test Group3'
    fill_in 'Icon', with: 'fa-user'
    click_button 'Create Group'

    expect(page).to have_content('Group was successfully created.')
  end

  it 'should not add new group' do
    fill_in 'Name', with: ''
    fill_in 'Icon', with: 'fa-user'
    click_button 'Create Group'

    expect(page).to have_content("Name can't be blank")
  end
end
