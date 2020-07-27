class HospitalsController < ApplicationController
  def show
    @visits = Visit
      .where(
        hospital_id: params[:id]
      )
      .select(
        :pac,
        :visit_type,
        "COUNT(id) as visit_count"
      )
      .group(:pac, :visit_type)
  end
end
