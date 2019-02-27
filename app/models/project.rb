class Project < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :customer, class_name: 'User', required: false
  has_many :tasks, dependent: :destroy
end
