require "rails_helper"

module Kn
  describe ContactInformation do
    it { should belong_to(:user) }

    it { should validate_presence_of(:name) }
    it { should validate_inclusion_of(:name).in_array(%w(phone fax mobile)) }
    it { should validate_presence_of(:value) }

    it "has a valid factories" do
      expect(build(:mobile)).to be_valid
      expect(build(:fax)).to be_valid
      expect(build(:phone)).to be_valid
    end
  end
end
