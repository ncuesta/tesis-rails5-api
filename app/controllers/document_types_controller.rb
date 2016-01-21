class DocumentTypesController < ApplicationController
  before_action :set_document_type, only: [:show]

  # GET /document_types
  def index
    @document_types = DocumentType.all

    render(json: @document_types) if stale?(last_modified: @document_types.maximum(:updated_at), public: true)
  end

  # GET /document_types/1
  def show
    render(json: @document_type) if stale?(last_modified: @document_type.updated_at, public: true)
  end

  private

  def set_document_type
    @document_type = DocumentType.find_by(code: params[:code])
  end
end
