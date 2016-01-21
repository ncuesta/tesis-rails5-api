class AcademicUnitsController < ApplicationController
  before_action :set_academic_unit, only: [:show]

  # GET /academic_units
  def index
    conditional_render paginated(AcademicUnit)
  end

  # GET /academic_units/1
  def show
    conditional_render @academic_unit, links: { self: academic_unit_url(@academic_unit) }
  end

  private

  def set_academic_unit
    @academic_unit = AcademicUnit.find_by(code: params[:code])
  end
end
