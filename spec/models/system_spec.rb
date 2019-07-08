require 'rails_helper'

RSpec.describe System, type: :model do
 	describe 'associations' do
 		it { should have_and_belong_to_many(:themes) }
 end
end
