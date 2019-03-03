class Step < ApplicationRecord
  belongs_to :project
  has_many :tasks
  has_many :messages
  has_many :documents
end
