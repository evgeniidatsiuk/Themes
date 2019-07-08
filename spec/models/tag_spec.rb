require 'rails_helper'

RSpec.describe Tag, type: :model do
describe "associations" do
    it { should belong_to(:object) }
    it { should belong_to(:category) }
  end
end
