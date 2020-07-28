class VisitsController < ApplicationController
  def index
    if selected_type.present?
      @visits = Visit.where(visit_type: selected_type)
    else
      @visits = Visit.all
    end
  end

  def type_options
    [["All", nil]].tap do |arr|
      Visit.pluck(:visit_type).uniq!.each do |type|
        arr << type
      end
    end
  end
  helper_method :type_options

  def selected_type
    params.permit(:type)[:type]
  end
  helper_method :selected_type

end
