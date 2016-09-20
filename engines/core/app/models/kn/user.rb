module Kn
  class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable#, :confirmable

    include DeviseTokenAuth::Concerns::User

    has_many :contact_informations

    validates :name, presence: true
  end
end
