class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_one_attached :attached_file

  def attached_file_path
    ActiveStorage::Blob.service.path_for(attached_file.key)
  end
end
