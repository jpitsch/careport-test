class AddHospitalIds < ActiveRecord::Migration[5.2]
  def change
    rename_column :visits, :hospital, :hospital_name
    add_column :visits, :hospital_id, :text

    add_index :visits, :hospital_id
  end
end
