class Answer < ApplicationRecord
  # belongs_to :user
  belongs_to :task
  has_one_attached :attachment
end
