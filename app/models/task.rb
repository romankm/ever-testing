class Task < ApplicationRecord
  enum task_type: { technical: 'technical', english: 'english' }, _default: 'technical'
  validates :task_type, inclusion: { in: task_types.values, message: '%{value} is not a valid type' }
  has_one_attached :attached_file

  has_many :users
  has_many :answers

  def attached_file_path
    ActiveStorage::Blob.service.path_for(attached_file.key)
  end
end
