require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/7/posts' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'user posts' template" do
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET /:id' do
    before(:example) { get '/users/7/posts/4' }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'post' template" do
      expect(response).to render_template('posts/show')
    end
  end
end
