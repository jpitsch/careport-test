class Visit < ApplicationRecord
  enum visit_type: { "SNF": 2, "Hospice": 3, "HHA": 4 }
end
