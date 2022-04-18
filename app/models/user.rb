class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_one_base64_attached :avatar
end
