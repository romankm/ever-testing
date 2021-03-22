class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :send_invite, on: :create

  belongs_to :english_task, class_name:  'Task', optional: true
  belongs_to :technical_task, class_name: 'Task', optional: true

  # validate :tasks_types
  # validate :english_task_type, :technical_task_type

  def tasks_assigned?
    english_task.present? and technical_task.present?
  end

  def send_invite
    InviteMailer.with({ email: email, password: password}).invite.deliver_later
  end
end
