require 'rails_helper'

RSpec.describe 'Bill new', type: :feature do
  before(:each) do
    visit user_session_path

    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: 'foobar')
    @group1 = Group.create(name: 'Test Group1', icon: 'fa-user')

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit new_bill_path
  end

  it 'should add new bill' do
    fill_in 'Name', with: 'Test Bill'
    fill_in 'Description', with: 'Test description'
    fill_in 'Amount', with: 100
    select 'Test Group1', from: 'Group'
    fill_in 'Due date', with: Date.today
    click_button 'Save'

    expect(page).to have_content('Test Bill was successfully created.')
  end

  it 'should not add new bill' do
    fill_in 'Name', with: ''
    fill_in 'Description', with: 'Test description'
    fill_in 'Amount', with: 100
    select 'Test Group1', from: 'Group'
    fill_in 'Due date', with: Date.today
    click_button 'Save'

    expect(page).to have_content("Name can't be blank")
  end

  it 'should not add new bill' do
    fill_in 'Name', with: 'Test Bill'
    fill_in 'Description', with: 'Test description'
    fill_in 'Amount', with: 100
    select '', from: 'Group'
    fill_in 'Due date', with: Date.today
    click_button 'Save'

    expect(page).to have_content("Group can't be blank")
  end

  it 'should return to the group page of that transaction' do
    fill_in 'Name', with: 'Test Bill'
    fill_in 'Description', with: 'Test description'
    fill_in 'Amount', with: 100
    select 'Test Group1', from: 'Group'
    fill_in 'Due date', with: Date.today
    click_button 'Save'

    expect(page).to have_content('Test Bill was successfully created.')
    expect(page).to have_content('Test Group1')
  end

  it 'should return to the group page of that transaction when the user clicks the back(<) button' do
    click_link '<'

    expect(page).to have_content('Test Group1')
  end
end
