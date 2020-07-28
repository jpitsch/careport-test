class HospitalsService
  attr_reader :hospital_id, :code

  def initialize(hospital_id:, code:)
    @hospital_id = hospital_id
    @code = code
  end

  def visits_by_hospital
    code.blank? ? base_query : filter_by_code
  end

  private
    
  def base_query
    Visit
      .where(hospital_id: hospital_id)
      .select(:pac,:visit_type,"COUNT(id) as visit_count")
      .group(:pac, :visit_type)
  end

  def filter_by_code
    base_query.where("codes @> ?", [{code: code}].to_json)
  end
end
