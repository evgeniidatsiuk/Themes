require 'rails_helper'

RSpec.describe SystemsController, type: :controller do
context 'GET #index' do
   it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
   end
  end
end
