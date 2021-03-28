class AnswersController < ApplicationController
  # GET /answers/new/:task_id
  def new
    params.require(:task_id)
    @task_id       = params[:task_id]
    @task          = Task.find_by(id: @task_id)
    english_task   = current_user.english_task
    technical_task = current_user.technical_task

    if !@task.present? || technical_task.id ==! @task_id || english_task.id ==! @task_id
      flash[:alert] = 'No such task'
      redirect_to :root
    end

    @answer      = Answer.new
    @answer.task = @task

    render template: 'answers/new'
  end

  def create
    filtered_answer_params = answer_params
    @answer = Answer.new(filtered_answer_params)
    @task   = Task.find_by(id: filtered_answer_params[task_id])

    uploaded_io = filtered_answer_params[:attachment]

    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    if @answer.save
      redirect_to :root
    end

    render new_answer_for_task
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:task_id, :link, :attachment)
    end

    def define_task(task_id)
      @task = Task.find_by(id: task_id)
    end
end
