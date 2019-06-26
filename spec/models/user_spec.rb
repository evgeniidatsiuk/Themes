require 'rails_helper'


 
RSpec.describe User, type: :model do
  subject{
    build(:user)
  }

  describe "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
  end

 it "should not be valid without email" do
       subject.email = nil
       expect(subject).to_not be_valid
    end
  
   it "should not be valid without password" do
       subject.password = nil
       expect(subject).to_not be_valid
    end
  

    it "should not be valid without nickname" do
       subject.nickname = nil
       expect(subject).to_not be_valid
    end
  end

  describe "associations" do
    it { should have_one(:userparam).dependent(:destroy) }
    it { should have_one(:userparam) }
    it { should have_many(:themes) }
    it { should have_many(:comments) }
    
  end
end


