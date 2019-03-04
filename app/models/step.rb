class Step < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :documents, dependent: :destroy
end
