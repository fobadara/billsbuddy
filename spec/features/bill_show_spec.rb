require 'rails_helper'

RSpec.describe 'Bill show', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: 'foobar')
    @group1 = Group.create(name: 'Test Group1', icon: 'fa-user')
    @bill = Bill.create(name: 'Test Bill', description: 'Test description', amount: 100, author_id: @user.id, group_id: group1.id, due_date: Date.today)
    @bill1 = Bill.create(name: 'Test Bill1', amount: 100, description: 'Test description', author_id: @user.id, group_id: @group1.id, due_date: Date.today)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit new_bill_path
  end

  it 'should show bill details page' do 
    expect(page).to have_content('Test Bill')
    expect(page).to have_content('Test description')
    expect(page).to have_content('100')
    expect(page).to have_content('Test Group1')
    expect(page).to have_content(Date.today)
  end
end
