require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /login' do
    before(:each) do
      @user1 = User.create(
        name: 'Rich',
        bio: 'Product Manager',
        photo: 'http://product.com',
        post_counter: 2
      )
    end
    it 'autenticate client' do
      post '/api/v1/authenticate', params: { name: @user1.name, password: '123456' }
      expect(response).to have_http_status(:created)
      expect(response.body).to eq({ 'token' => '123' })
    end
  end
end
