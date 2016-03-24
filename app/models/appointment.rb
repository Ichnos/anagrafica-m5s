class Appointment < ActiveRecord::Base
    belongs_to :user
  has_many :appointment_categories
  has_many :categories, through: :article_categories
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :user_id, presence: true
end
