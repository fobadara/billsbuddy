require 'rails_helper'

RSpec.describe 'Bill show', type: :feature do
  before(:example) do
    visit user_session_path
    valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")

    @user = User.create(name: 'Tested User', email: 'test@mail.com', password: 'foobar123##')
    @group1 = Group.create(name: 'Test Group', image: valid_image, user_id: @user.id)
    @bill1 = Bill.create(name: 'Test Bill1', amount: 100, category: @group1, due_date: Date.today, user_id: @user.id)

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_button 'Log in'

    visit group_bill_path(@group1, @bill1)
  end

  it 'should show bill details page' do
    expect(page).to have_content('Details')
  end
end
