# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_01_174623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "visits", force: :cascade do |t|
    t.text "patient"
    t.date "patient_dob"
    t.jsonb "patient_attributes"
    t.date "admit_date"
    t.text "hospital_name"
    t.integer "visit_type"
    t.text "pac"
    t.jsonb "codes", default: "[]"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "hospital_id"
    t.index ["admit_date"], name: "index_visits_on_admit_date"
    t.index ["codes"], name: "index_visits_on_codes", using: :gin
    t.index ["hospital_id"], name: "index_visits_on_hospital_id"
    t.index ["hospital_name"], name: "index_visits_on_hospital_name"
    t.index ["pac"], name: "index_visits_on_pac"
    t.index ["patient_attributes"], name: "index_visits_on_patient_attributes", using: :gin
    t.index ["visit_type"], name: "index_visits_on_visit_type"
  end

end
