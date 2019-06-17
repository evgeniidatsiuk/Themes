require 'rails_helper'

 RSpec.describe UserparamsController, type: :controller do
  let!(:user){ build(:user, email: "test@test.com")}

   login_user

  it "should have a current_user" do
  expect(subject.current_user).to_not eq(nil)
 end


  describe 'GET #new' do
    it "should find current_user and open form for create Userparam" do
      get :new, params: {id: subject.current_user.id}
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)     
    end
  end

    describe 'POST #create' do
    it "should create profile and redirect to index page" do
      post :create, params: {profile: {firstname:"Harry", lastname:"Poter"}}
      expect(subject.current_user.profile.nickname).to eq("Mippo")
      expect(response).to redirect_to root_path
    end
  end

 describe 'GET #edit' do
    it "should find current_user and open form for edit Userparam" do
      get :edit, params: {id: subject.current_user.id}
      expect(subject.current_user.email).to eq("tester@test.com")
      expect(subject.current_user.email).to_not eq(user.email)
      expect(response).to have_http_status(200)
    end
  end


  describe 'PATCH #update' do
  	before do
      @userparam = create(:profile, user_id: subject.current_user.id)
    end  
    it "should update userparam and redirect to profile" do
      patch :update, params: { id: subject.current_user.id, profile: {firstname:"Harry", lastname:"Poter"}}
      expect(subject.current_user.profile.nickname).to eq("Tester2")
      expect(response).to redirect_to profile_index_path
    end
  end


   describe "GET #show" do
   it "has a 200 status code" do
   expect(response.status).to eq(200)
  end

   it "responds to html by default" do
   expect(response.content_type)=="text/html"
  end
 end



 end