class JobOffer < ApplicationRecord
  belongs_to :user
  has_many :job_applications
  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :requirements, presence: true, length: { minimum: 10 }
end
