class HospitalsController < ApplicationController
  def show
    @visits = hospitals_service.visits_by_hospital
  end

  private

  def hospitals_service
    HospitalsService.new(
      hospital_id: create_params[:id], 
      code: create_params[:code]
    )
  end

  def create_params
    params.require([:id])
    params.permit(
      :id,
      :code
    ).to_h.with_indifferent_access
  end

  def code_options
    [["All", nil]].tap do |arr|
      Visit.pluck(:codes).flatten.uniq!.each do |code|
        arr << [code['name'], code['code']]  
      end
    end
  end
  helper_method :code_options

  def selected_code
    create_params[:code]
  end
  helper_method :selected_code
end
