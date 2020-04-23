class Creator < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :messages
end
