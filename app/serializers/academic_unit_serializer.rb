class AcademicUnitSerializer < ActiveModel::Serializer
  attributes :code, :name

  def id
    object.code
  end
end
