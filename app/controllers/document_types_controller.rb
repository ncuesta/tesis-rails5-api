class DocumentTypesController < ApplicationController
  before_action :set_document_type, only: [:show]

  # GET /document_types
  def index
    conditional_render paginated(DocumentType)
  end

  # GET /document_types/1
  def show
    conditional_render @document_type, links: { self: document_type_url(@document_type) }
  end

  private

  def set_document_type
    @document_type = DocumentType.find_by(code: params[:code])
  end
end
