module Kn
  class ContactInformation < ApplicationRecord
    belongs_to :user

    validates :name, :value, presence: true
    validates :name, inclusion: { in: %w(phone fax mobile) }
  end
end
