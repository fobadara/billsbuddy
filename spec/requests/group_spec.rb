require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET groups_path' do
    before(:each) do
      @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar123#')
      login_as(@fob, scope: :user)

      get groups_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET new_group_path' do
    before(:each) do
      @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar')
      login_as(@fob, scope: :user)

      get new_group_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
