class DocumentTypeSerializer < ActiveModel::Serializer
  attributes :code, :abbreviation, :name

  link :self

  def id
    object.code
  end
end
