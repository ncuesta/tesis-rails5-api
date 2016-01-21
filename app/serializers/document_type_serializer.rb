class DocumentTypeSerializer < ActiveModel::Serializer
  cache key: 'document_types'
  attributes :code, :abbreviation, :name

  def id
    object.code
  end
end
