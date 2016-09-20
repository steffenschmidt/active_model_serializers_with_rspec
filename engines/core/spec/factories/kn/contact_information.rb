module Kn
  FactoryGirl.define do
    factory :contact_information, class: "Kn::ContactInformation" do
      user
    end

    factory :phone, parent: :contact_information do
      name "phone"
      value "+49 123 4567890"
    end

    factory :fax, parent: :contact_information do
      name "fax"
      value "+49 987 6543210"
    end

    factory :mobile, parent: :contact_information do
      name "mobile"
      value "+49 151 1234567890"
    end
  end
end
