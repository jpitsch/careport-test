class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.text :patient
      t.date :patient_dob
      t.jsonb :patient_attributes
      t.date :admit_date
      t.text :hospital
      t.integer :visit_type
      t.text :pac
      t.jsonb :codes, default: "[]"

      t.index :admit_date
      t.index :hospital
      t.index :visit_type
      t.index :pac
      t.index :codes, using: :gin
      t.index :patient_attributes, using: :gin

      t.timestamps
    end
  end
end
