class Task < ApplicationRecord
  belongs_to :step
  belongs_to :project
  has_many :messages, dependent: :destroy
  has_many :documents, dependent: :destroy
end
