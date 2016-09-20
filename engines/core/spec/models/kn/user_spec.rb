require "rails_helper"

module Kn
  describe User do
    it { should have_many(:contact_informations) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password) }

    it "has the right devise modules loaded" do
       expect(build(:user).devise_modules).to eq [:database_authenticatable, :rememberable, :recoverable, :registerable, :validatable, :trackable]
    end

    it "does not load the confirmable module" do
      expect(build(:user).devise_modules.include?(:confirmable)).to be_falsey
    end

    it "loads the DeviseTokenAuth concern" do
      expect(User.ancestors.include?(DeviseTokenAuth::Concerns::User)).to be_truthy
    end

    it "does not load the Omniauth module" do
      expect(build(:user).devise_modules.include?(:omniauthable)).to be_falsey
    end

    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    describe "should not have an invalid email address" do
      emails = ["asdf@ ds.com", "@example.com", "test me @yahoo.com", "asdf@example", "ddd@.d. .d", "ddd@.d"]
      emails.each do |email|
        it { is_expected.not_to allow_value(email).for(:email) }
      end
    end

    describe "should have a valid email address" do
      emails = ["asdf@ds.com", "hello@example.uk", "test1234@yahoo.si", "asdf@example.eu"]
      emails.each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end

    it "is invalid with different password and password confirmation" do
      expect(build(:user, password: "secret", password_confirmation: "another-secret")).to be_invalid
    end
  end
end
