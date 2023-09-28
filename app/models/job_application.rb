class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job_offer

  validates :message, presence: true, length: { minimum: 2, maximum: 500 }
  validates :user_id, uniqueness: { scope: :job_offer_id, message: 'Ya te has postulado a este trabajo' }
end