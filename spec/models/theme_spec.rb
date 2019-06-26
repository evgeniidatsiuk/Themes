require 'rails_helper'

RSpec.describe Theme, type: :model do
	let!(:user){create(:user)}

  subject{
     build(:theme, user: user)
  }

  describe "associations" do
    it { should have_many(:comments).dependent(:destroy)  }
    it { should have_many(:tags) }
    it { should have_and_belong_to_many(:systems) }
    it { should belong_to(:user) }
  end


    
  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    
    it "should not be valid without name" do
       subject.name = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:name) }
    
    it "should not be valid without description" do
       subject.description = nil
       expect(subject).to_not be_valid
    end
    
    it { should validate_presence_of(:description) }
  end
  
end
