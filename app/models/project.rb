class Project < ApplicationRecord
  belongs_to :user
  has_many :users, through: :members, source: :user
  has_many :tasks
  has_many :messages
end
