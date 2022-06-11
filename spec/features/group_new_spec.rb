require 'rails_helper'

RSpec.describe 'Group new', type: :feature do
  before(:each) do
    visit user_session_path

    @valid_image = 'app/assets/images/test-logo.png'

    @user = User.create(name: 'Tested User', email: 'test@mail.com', password: 'foobar123##')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit new_group_path
  end

  it 'should add new group' do
    fill_in 'Name', with: 'Test Group3'
    attach_file 'Image', @valid_image
    click_button 'Save'

    expect(page).to have_content('Group was successfully created.')
  end

  it 'should not add new group' do
    fill_in 'Name', with: ''
    attach_file 'Image', @valid_image
    click_button 'Save'
  end

  it 'should not add new group' do
    fill_in 'Name', with: 'Test Group3'
    click_button 'Save'

    expect(page).to have_content("Image can't be blank")
  end
end
