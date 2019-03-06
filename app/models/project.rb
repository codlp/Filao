class Project < ApplicationRecord
  CATEGORIES = ["Web development", "Software", "Mobile", "Security"]
  belongs_to :user, class_name: 'User' # has_many ?
  belongs_to :customer, class_name: 'User', required: false
  has_many :steps, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :documents, through: :tasks
  has_many :messages, through: :tasks
  validates :category, inclusion: { in: CATEGORIES }

  def is_done?
    tasks.all? do |task|
      task.is_done?
    end
  end

  def self.count_done
    self.all.select { |project| project.is_done? }.count
  end

  def self.count_undone
    self.all.reject { |project| project.is_done? }.count
  end
end
