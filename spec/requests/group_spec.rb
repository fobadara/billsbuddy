require 'rails_helper'

RSpec.describe 'Group', type: :request do
  describe 'GET groups_path' do
    context 'when user is not loggedin' do
      it 'redirects to login page' do
        get groups_path
        expect(response).to redirect_to(login_path)
      end

      it 'shows flash message' do
        get groups_path
        expect(flash[:danger]).to eq('Please login first')
      end
    end

    context 'when user is loggedin' do
      before(:each) do
        @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar')
        login_as(@fob, scope: :user)

        get groups_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET new_group_path' do
    context 'when user is not loggedin' do
      it 'redirects to login page' do
        get new_group_path
        expect(response).to redirect_to(login_path)
      end

      it 'shows flash message' do
        get new_group_path
        expect(flash[:danger]).to eq('Please login first')
      end
    end

    context 'when user is loggedin' do
      before(:each) do
        @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar')
        login_as(@fob, scope: :user)

        get new_group_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end
end
