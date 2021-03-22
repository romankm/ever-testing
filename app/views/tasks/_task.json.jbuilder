json.extract! task, :id, :body, :level, :attachment, :created_at, :updated_at
json.url task_url(task, format: :json)
