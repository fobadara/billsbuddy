require 'rails_helper'

RSpec.describe 'Group index', type: :feature do
  before(:each) do
    visit user_session_path

    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: 'foobar')
    @group1 = Group.create(name: 'Test Group1', icon: 'fa-user')
    @group2 = Group.create(name: 'Test Group2', icon: 'fa-user')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit groups_path
  end

  it 'should show group index' do
    expect(page).to have_content('Test Group1')
    expect(page).to have_content('Test Group2')
  end

  it 'should show group details' do
    click_link 'Test Group1'

    expect(page).to have_content('Test Group1')
    expect(page).to have_content('fa-user')
  end

  it 'should not show group details' do
    click_link 'Test Group3'

    expect(page).to have_content('The page you were looking for doesn\'t exist (404)')
  end

  it 'should navigate to add category page' do
    click_link 'Add a new Category'

    expect(page).to have_content('Add Category')
  end
end
