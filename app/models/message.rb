class Message < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :step
end
