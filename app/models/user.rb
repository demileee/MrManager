class User < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :tasks
  has_many :messages
  belongs_to :task, optional: true

  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :last_name, :first_name, :password_confirmation, presence: true

  validates :email, uniqueness: true

  before_create :robo_hash

  def robo_hash
    self.profile_pic = "http://robohash.org/#{self.first_name + self.last_name}?set=set4"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
