class VisitsController < ApplicationController
  def index
    if selected_type.present?
      @visits = Visit.where(visit_type: selected_type)
    else
      @visits = Visit.all
    end
  end

  def type_options
    [
      ["All", nil],
      ["SNF", 2],
      ["Hospice", 3],
      ["HHA", 4]
    ]
  end
  helper_method :type_options

  def selected_type
    params.permit(:type)[:type]
  end
  helper_method :selected_type

end
