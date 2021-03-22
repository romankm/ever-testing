module UserLevel
  JUNIOR = :junior
  MIDDLE = :middle
  SENIOR = :senior

  def self.all
    constants(false).map(&method(:const_get))
  end

  # def title_by_const(const)
  #   if self.constants(false).include? const
  #     LEVELS[const]
  #   else
  #     raise Exception 'no such level'
  #   end
  # end
end
