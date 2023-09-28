class JobOffer < ApplicationRecord
  belongs_to :user
  has_many :job_applications, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { minimum: 2, maximum: 2000 }
end
