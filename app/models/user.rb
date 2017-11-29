class User < ApplicationRecord
  has_secure_password

  has_many :projects
  has_many :tasks
  has_many :messages
  belongs_to :task, optional: true

  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :password, confirmation: true, allow_nil: true
  validates :last_name, :first_name, presence: true
  validates :email, uniqueness: true
  before_create :robo_hash

  def robo_hash
    self.profile_pic = "http://robohash.org/#{self.first_name + self.last_name}?set=set4"
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def remove_pinned_task
    self.task = nil
    self.save
  end

end
