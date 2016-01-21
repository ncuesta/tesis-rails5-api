class AcademicUnitSerializer < ActiveModel::Serializer
  cache key: 'academic_units'
  attributes :code, :name

  def id
    object.code
  end
end
