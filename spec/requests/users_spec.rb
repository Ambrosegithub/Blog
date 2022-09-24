require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:each) do
      get '/users'
    end

    it 'renders correct placeholder text ' do
      expect(response.body).to include('Welcom user')
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it "'http request is successfull" do
      expect(response).to have_http_status(:success)
    end
  end
end
