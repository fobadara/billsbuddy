require 'rails_helper'

RSpec.describe 'Group show', type: :feature do
  before(:each) do
    visit user_session_path
    @user = User.create(name: 'Test User', email: 'abc@mail.com', password: 'foobar')
    @group1 = Group.create(name: 'Test Group1', icon: 'fa-user')
    @bill1 = Bill.create(name: 'Test Bill1', amount: 100, description: 'Test description', user_id: @user.id,
                         group_id: @group1.id, due_date: Date.today)
    @bill2 = Bill.create(name: 'Test Bill2', amount: 100, description: 'Test description', user_id: @user.id,
                         group_id: @group1.id, due_date: Date.today)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit new_group_path
  end

  it 'should show list of bills for a group' do
    expect(page).to have_content('Test Bill1')
    expect(page).to have_content('Test Bill2')
  end

  it 'should show bill details' do
    click_link 'Test Bill1'

    expect(page).to have_content('Test Bill1')
    expect(page).to have_content('Test description')
    expect(page).to have_content('100')
    expect(page).to have_content('Test Group1')
    expect(page).to have_content(Date.today)
  end

  it 'should navigate to add bill page' do
    click_link 'Add a new Bill'

    expect(page).to have_content('Add Bill')
  end

  it 'should navigate to edit bill page' do
    click_link 'Test Bill1'
    click_link 'Edit'

    expect(page).to have_content('Edit Bill')
  end

  it 'should delete bill page' do
    click_link 'Test Bill1'
    click_link 'Delete'

    expect(page).to have_content('Bill was successfully deleted')
  end

  it 'should show total amount for a group' do
    expect(page).to have_content('Total: $200')
  end

  it 'should navigate to the homepage when clicking on the back (<) button' do
    click_link '<'

    expect(page).to have_content('Bills')
  end
end
