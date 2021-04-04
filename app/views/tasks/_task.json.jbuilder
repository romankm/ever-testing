json.extract! task, :id, :body, :level, :attached_file, :created_at, :updated_at
json.url task_url(task, format: :json)
