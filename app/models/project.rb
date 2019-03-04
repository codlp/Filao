class Project < ApplicationRecord
  CATEGORIES = ["Web development", "Software", "Mobile", "Security"]
  belongs_to :user, class_name: 'User' # has_many ?
  belongs_to :customer, class_name: 'User', required: false
  has_many :steps, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :category, inclusion: { in: CATEGORIES }
end
