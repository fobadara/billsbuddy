require 'rails_helper'

RSpec.describe 'Bill new', type: :feature do
  before(:each) do
    visit user_session_path

    valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")

    @user = User.create(name: 'Tested User', email: 'test@mail.com', password: 'foobar123##')
    @group1 = Group.create(name: 'Test', image: valid_image, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit new_group_bill_path(@group1)
  end

  it 'should add new bill' do
    fill_in 'Name', with: 'Test Bill'
    fill_in 'Description', with: 'Test description'
    fill_in 'Amount', with: 100
    select 'Test', from: 'Category'
    fill_in 'Due date', with: Date.today
    click_button 'Save'

    expect(page).to have_content('Bill was successfully created.')
  end

  it 'should return to the group page of that transaction' do
    fill_in 'Name', with: 'Test Bill'
    fill_in 'Description', with: 'Test description'
    fill_in 'Amount', with: 100
    select 'Test', from: 'Category'
    fill_in 'Due date', with: Date.today
    click_button 'Save'

    expect(page).to have_content('Bill was successfully created.')
    expect(page).to have_content('Test')
  end

  it 'should return to the group page of that transaction when the user clicks the back(<) button' do
    click_link 'Back to categories'

    expect(page).to have_content('List of Bills')
  end
end
