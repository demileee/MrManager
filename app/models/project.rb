class Project < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :tasks
  has_many :messages
end
