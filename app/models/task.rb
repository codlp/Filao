class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :documents, dependent: :destroy
end
