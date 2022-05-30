require 'rails_helper'

RSpec.describe 'User', type: :request do
  describe 'GET edit_user_path(:id)' do
    context 'when user is not loggedin' do
      it 'redirects to login page' do
        get edit_user_path(1)
        expect(response).to redirect_to(login_path)
      end

      it 'shows flash message' do
        get edit_user_path(1)
        expect(flash[:danger]).to eq('Please login first')
      end
    end

    context 'when user is loggedin' do
      before(:each) do
        @fob = User.create(name: 'Foobar', email: 'foo@mail.com', password: 'foobar')
        login_as(@fob, scope: :user)

        get edit_user_path(@fob)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end
    end
  end
end
