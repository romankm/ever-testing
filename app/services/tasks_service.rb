class TasksService
  def self.assign_task(user, task_type)
    task_types = Task.task_types
    # task_type = task_type.to_h

    raise 'Must be instance of User' unless user.kind_of? User
    raise "Must be one of: #{ task_types.values.join(', ') }, but given:#{task_type}" unless task_types.has_value? task_type

    random_task = self.random_task(task_type)

    case task_type
    when :technical
      user.technical_task = random_task
    when :english
      user.english_task = random_task
    else
      throw Exception 'cant happen'
    end

    user.save
  end

  def self.random_task(task_type)
    all = Task.where(task_type: task_type)

    unless all
      throw Exception 'No tasks yes'
    end

    Task.find_by_id(all.pluck(:id).sample)
  end
end

