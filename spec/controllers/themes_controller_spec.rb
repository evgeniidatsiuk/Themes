require 'rails_helper'

RSpec.describe ThemesController, type: :controller do
  let!(:user){ build(:user, email: "test@test.com")}

  login_user

  describe 'before actions' do
    describe 'find_theme' do
      it 'is expected to define before action' do
        is_expected.to use_before_action(:find_theme)
      end
    end
  end


    context 'GET #index' do
     it 'should success and render to index page' do
        get :index
        expect(response).to have_http_status(200)
        expect(response).to render_template :index
     end
    end

    context 'GET #show' do
   let!(:theme) { create :theme, user: user }

    it 'should success and render to edit page' do
       get :show, params: { id: theme.id }
       expect(response).to have_http_status(200)
       expect(response).to render_template :show
    end
  end

  context 'GET #edit' do
 let!(:theme) { create :theme, user: user }

  it 'should success and render to edit page' do
     get :edit, params: { id: theme.id }
     expect(response).to have_http_status(200)
     expect(response).to render_template :edit
  end
end
  context 'PUT #update' do
 let!(:theme) { create :theme, user: user }

 it 'should update theme info' do
   params = {
    name: 'Wow',
    description: 'meep',
    download: 'qewq'
    
   }

   put :update, params: { id: theme.id, theme: params }
   theme.reload
   params.keys.each do |key|
    expect(theme.attributes[key.to_s]).to eq params[key]
   end
  end
 end

 context 'DELETE #destroy' do
 let!(:theme) { create :theme, user: user }

it 'should delete theme' do
   expect { delete :destroy, params: { id: theme.id } }.to change(Theme, :count).by(-1)
  # expect(flash[:notice]).to eq 'Product was successfully deleted.'
  end
 end

end