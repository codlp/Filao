class Task < ApplicationRecord
  belongs_to :project
  belongs_to :step, through: :project
  has_many :messages, dependent: :destroy
  has_many :documents, dependent: :destroy
end
