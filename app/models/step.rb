class Step < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many :messages, through: :tasks
  has_many :documents, through: :tasks
end
