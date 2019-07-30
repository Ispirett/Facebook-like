require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  login_user
   context 'validates logic' do
    it 'should redirect if now logged in' do
      get :index
      expect(response.status).to eq 200
    end
   end
end
