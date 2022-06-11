require 'rails_helper'

RSpec.describe BillsController, type: :request do
  describe 'GET new_bill_path' do
    before(:example) do
      valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")
      user = User.create(id: '10', name: 'smith', email: 'smith@mail.com', password: 'Fob123233#')
      login_as(user)
      @group = Group.create(id: '2', name: 'Group 1', image: valid_image, user_id: user.id)
    end

    it 'renders the new bill page' do
      get new_group_bill_path(group_id: @group.id)
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST create_bill_path' do
    before(:example) do
      valid_image = Rack::Test::UploadedFile.new("#{Rails.root}/app/assets/images/test-logo.png")
      user = User.create(id: '10', name: 'smith', email: 'smith@mail.com', password: 'Fob123233#')
      login_as(user)
      @group = Group.create(id: '2', name: 'Group 1', image: valid_image, user_id: user.id)
    end

    it 'creates a new bill' do
      post group_bills_path(@group.id), params: { bill: { name: 'Bill 1', amount: '100', category: @group } }
      expect(response).to have_http_status(302)

      bill = Bill.last
      expect(bill.name).to eq('Bill 1')
      expect(bill.amount).to eq(100)
      expect(response).to redirect_to(group_path(@group.id))
    end
  end
end
