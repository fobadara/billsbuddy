require 'rails_helper'

RSpec.describe 'Bill', type: :request do
  describe 'GET bills_path' do
    context 'when user is not loggedin' do
      it 'redirects to login page' do
        get bills_path
        expect(response).to redirect_to(login_path)
      end

      it 'shows flash message' do
        get bills_path
        expect(flash[:danger]).to eq('Please login first')
      end
    end

    context 'when user is loggedin' do
      before(:each) do
        @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar')
        login_as(@fob, scope: :user)

        get bills_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        expect(response).to render_template('index')
      end
    end
  end

  describe 'GET new_bill_path' do
    context 'when user is not loggedin' do
      it 'redirects to login page' do
        get new_bill_path
        expect(response).to redirect_to(login_path)
      end

      it 'shows flash message' do
        get new_bill_path
        expect(flash[:danger]).to eq('Please login first')
      end
    end

    context 'when user is loggedin' do
      before(:each) do
        @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar')
        login_as(@fob, scope: :user)

        get new_bill_path
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the new template' do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET edit_bill_path(:id)' do
    context 'when user is not loggedin' do
      it 'redirects to login page' do
        get edit_bill_path(1)
        expect(response).to redirect_to(login_path)
      end

      it 'shows flash message' do
        get edit_bill_path(1)
        expect(flash[:danger]).to eq('Please login first')
      end
    end

    context 'when user is loggedin' do
      before(:each) do
        @fob = User.create(name: 'Foobar', email: 'abc@mail.com', password: 'foobar')
        login_as(@fob, scope: :user)

        get edit_bill_path(1)
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders the edit template' do
        expect(response).to render_template('edit')
      end

      it 'assigns the requested bill to @bill' do
        expect(assigns(:bill)).to eq(Bill.first)
      end
    end
  end
end
