ActiveAdmin.register Task do
  permit_params :body, :attached_file, :user_level, :task_type

  form title: 'New task' do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Task' do
      f.input :body, required: false
      f.input :attached_file, as: :file, required: false
      f.input :task_type,  collection: Task.task_types.values, as: :radio,  required: true
      f.input :user_level, collection: UserLevel::all,         as: :select, required: true
    end

    f.actions
  end

  index do
    selectable_column
    column :body
    column 'File' do |task|

      # rails_service_blob_path(task.attached_file, disposition: "attachment")
      # link_to('File lol', download_admin_task_path(task)) if task.attached_file.present?
      # if task.attached_file.attached?
      #   # link_to 'File lol', task.attached_file.filena
      #   link_to('File lol', download_admin_task_path(task)) if task.attached_file.present?
      # else
      #   '<no file>'
      # end
    end
    column :user_level
    column :task_type
    column :created_at
    actions
  end

  # action_item only: [:show] do
  # download_admin_user_path(resource)) if resource.upload_file.present?
  #   link_to('Download File', download_admin_task_path(resource)) if resource.upload_file.present?
  # end

  # member_action :download, method: :get do
  #   task = Task.find(params[:id])
    # send_file task.attached_file.path
    # send_file task.attached_file.path

    # rails_blob_path(task.attached_file, disposition: "attachment")

    # send_file 'File',
    #   :filename =>  task.attached_file_path,
    #   :disposition => 'attachment'

  # end

  # show do
  #   render 'show', { task: task }
  # end
end
