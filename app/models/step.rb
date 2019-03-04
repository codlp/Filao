class Step < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy
  has_many :messages, through: :tasks
  has_many :documents, through: :tasks

  def progress
    tasks = self.tasks
    done_tasks = tasks.where(is_done: true)
    progress = done_tasks.size.fdiv(tasks.size) * 100
  end
end
