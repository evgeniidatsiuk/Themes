require 'rails_helper'

RSpec.describe Userparam, type: :model do
	let!(:user){create(:user)}

  subject{
     build(:userparam, user: user)
  }
 describe "associations" do
	it { should belong_to(:user) } 
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without firstname" do
       subject.firstname = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:firstname) }
    
    it "should not be valid without lastname" do
       subject.lastname = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:lastname) }
    it "should not be valid without age" do
       subject.age = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:age) }
  end
end
