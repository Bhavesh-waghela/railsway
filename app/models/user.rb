class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :name, use: :slugged
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :votes
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  scope :start_with, -> (name) { where("name like ?", "#{name}%")}

  def set_default_role
    self.role ||= :user
  end

  def self.search(search)
  if search
    where('name LIKE ?', "%#{search}%")
  else
    scoped
  end
end
end
