file_path = Rails.root.join('data', 'visits.csv')

CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
  Visit.create!(
    patient: row[:patient],
    patient_dob: row[:patient_dob],
    patient_attributes: JSON.parse(row[:patient_attributes]),
    admit_date: row[:admit_date],
    hospital_name: row[:hospital_name],
    hospital_id: row[:hospital_id],
    visit_type: row[:visit_type],
    pac: row[:pac],
    codes: JSON.parse(row[:codes])
  )
end
