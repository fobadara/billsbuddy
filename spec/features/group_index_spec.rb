require 'rails_helper'

RSpec.describe 'Group index', type: :feature do
  before(:each) do
    visit user_session_path
    valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")

    @user = User.create(name: 'Tested User', email: 'test@mail.com', password: 'foobar123##')
    @group1 = Group.create(name: 'Test Group', image: valid_image, user_id: @user.id)
    @group2 = Group.create(name: 'Test Group2', image: valid_image, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit groups_path
  end

  it 'should show group index' do
    expect(page).to have_content('Categories')
  end

  it 'should navigate to add category page' do
    click_link 'New Category'

    expect(page).to have_content('NEW CATEGORY')
  end
end
