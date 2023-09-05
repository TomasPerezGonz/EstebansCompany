class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_offers
  has_many :job_applications
  has_many :notifications, dependent: :destroy
  has_one_attached :photo

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.admin ||= false
  end

  def admin?
    admin
  end
end

