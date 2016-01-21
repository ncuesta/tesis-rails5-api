class AcademicUnit < ApplicationRecord
  def to_s
    name
  end

  def to_param
    code.to_s
  end
end
