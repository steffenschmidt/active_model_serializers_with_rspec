module Kn
  class UserSerializer < ActiveModel::Serializer
    type 'user'

    attributes :id, :name, :email, :image
  end
end
