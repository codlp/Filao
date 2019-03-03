class Document < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :step
  mount_uploader :name, PhotoUploader
end
