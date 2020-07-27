require 'csv'

namespace :import do
  desc "Import Patients from patients csv file"
  task :patients => :environment do

    file_path = Rails.root.join('data', 'existing_patients.csv')

    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      Patient.create!(
        first_name: row[:first],
        last_name: row[:last],
        birth_date: row[:birth_date]
      )
    end
    
  end
end
