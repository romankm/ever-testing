class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.technical_task.present?
      @technical_task_answer = Answer.where('user_id = ? AND task_id = ?', current_user, current_user.technical_task)
    end

    if current_user.english_task.present?
      @english_task_answer = Answer.where('user_id = ? AND task_id = ?', current_user, current_user.english_task)

      if @english_task_answer.present? && @english_task_answer.attachment.attached?
        @eta_attachment = @english_task_answer.attachment
      end
    end
  end

  def assign_task
    task_type = assign_task_params

    begin
      TasksService::assign_task(current_user, task_type)
    rescue TasksService::NoTasksOfGivenTypeError => error
      flash[:alert] = error.message
    end

    redirect_to :root
  end

  private

    def assign_task_params
      params.require(:task_type)
    end

    def submit_answer_params
      params.require(:task_id)
    end
end
