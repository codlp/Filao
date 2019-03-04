class Document < ApplicationRecord
  belongs_to :task
  belongs_to :user
  mount_uploader :name, PhotoUploader
end
