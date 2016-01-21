class DocumentTypeSerializer < ActiveModel::Serializer
  attributes :code, :abbreviation, :name

  def id
    object.code
  end
end
