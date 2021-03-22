class Task < ApplicationRecord
  enum task_type: { technical: :technical, english: :english }, _default: :technical
  validates :task_type, inclusion: { in: task_types.keys, message: '%{value} is not a valid type'}

  has_many :users
end