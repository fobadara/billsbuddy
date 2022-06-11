require 'rails_helper'

RSpec.describe 'Group show', type: :feature do
  before(:each) do
    visit user_session_path

    valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")

    @user = User.create(name: 'Tested User', email: 'test@mail.com', password: 'foobar123##')
    @group1 = Group.create(name: 'Test Group', image: valid_image, user_id: @user.id)

    @bill1 = Bill.create(name: 'Test Bill1', amount: 100, category: @group1, due_date: Date.today, user_id: @user.id)
    @bill2 = Bill.create(name: 'Test Bill2', amount: 200, category: @group1, due_date: Date.today, user_id: @user.id)

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit group_path(@group1)
  end

  it 'should show list of bills for a group' do
    expect(page).to have_content('List of Bills')
  end

  it 'should navigate to add bill page' do
    click_link 'Add a new transaction'

    expect(page).to have_content('NEW BILL')
  end

  it 'should navigate to the homepage when clicking on the back (<) button' do
    click_link 'Back to groups'

    expect(page).to have_content('Categories')
  end
end
