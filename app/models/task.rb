class Task < ApplicationRecord
  enum task_type: { technical: 'technical', english: 'english' }, _default: 'technical'
  validates :task_type, inclusion: { in: task_types.values, message: '%{value} is not a valid type' }
  has_one_attached :attachment

  has_many :users
  has_many :answers
end
