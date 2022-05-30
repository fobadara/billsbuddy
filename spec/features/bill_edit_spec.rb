require 'rails_helper'

RSpec.describe 'Bill edit', type: :feature do
  before(:each) do
    visit user_session_path

    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: 'foobar')
    @group1 = Group.create(name: 'Test Group1', icon: 'fa-user')
    @bill1 = Bill.create(name: 'Test Bill1', amount: 100, author_id: @user.id, group_id: @group1.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit edit_bill_path(@bill1)
  end

  it 'should show edit bill page' do
    expect(page).to have_content('Edit Bill')
  end

  it 'should update bill details' do
    fill_in 'Name', with: 'Test Bill2'
    fill_in 'Description', with: 'Test description2'
    fill_in 'Amount', with: 200
    fill_in 'Due date', with: Date.today
    click_button 'Update Bill'

    expect(page).to have_content('Bill was successfully updated')
    expect(page).to have_content('Test Bill2')
    expect(page).to have_content('Test description2')
    expect(page).to have_content('200')
    expect(page).to have_content(Date.today)
  end

  it 'should navigate to the group details page when clicking on the back (<) button' do
    click_link '<'

    expect(page).to have_content('Test Group1')
  end
end
