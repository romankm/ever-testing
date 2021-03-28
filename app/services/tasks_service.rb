class TasksService
  class MustBeInstanceOfUserError < StandardError
    def message
      'Must be instance of User'
    end
  end

  class MustBeOneOfTaskTypesError < StandardError
    def initialize(given_type)
      @given_type = given_type
    end

    def message
      "Must be one of task type #{ task_types.values.join(', ') }. But given: '#{@given_type}'"
    end
  end

  class NoTasksOfGivenTypeError < StandardError
    def message
      'No tasks Of Given Type yet. Contact admin plz'
    end
  end

  class << self
    def assign_task(user, task_type)
      task_types = Task.task_types

      raise MustBeInstanceOfUserError unless user.kind_of? User
      raise MustBeOneOfTaskTypesError(task_type) unless task_types.has_value? task_type

      random_task = random_task(task_type)

      case task_type
        when 'technical'
          user.technical_task = random_task
        when 'english'
          user.english_task = random_task
        else
          raise StandardError 'cant happen'
      end

      user.save
    end

    def random_task(task_type)
      all = Task.where(task_type: task_type)

      if all.empty?
        raise NoTasksOfGivenTypeError
      end

      Task.find_by_id(all.pluck(:id).sample)
    end
  end
end

