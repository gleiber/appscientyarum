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

ActiveRecord::Schema.define(version: 20170322081042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_degrees", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "area_interests", force: :cascade do |t|
    t.integer  "line_investigation_id"
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["line_investigation_id"], name: "index_area_interests_on_line_investigation_id", using: :btree
  end

  create_table "blocks", force: :cascade do |t|
    t.string   "desde"
    t.string   "hasta"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "type_certificate_id"
    t.integer  "type_status_certificate_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["type_certificate_id"], name: "index_certificates_on_type_certificate_id", using: :btree
    t.index ["type_status_certificate_id"], name: "index_certificates_on_type_status_certificate_id", using: :btree
    t.index ["user_id"], name: "index_certificates_on_user_id", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "estado_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["estado_id"], name: "index_cities_on_estado_id", using: :btree
  end

  create_table "civil_statuses", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "classroom_laboratories", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "classroom_laboratory_resources", force: :cascade do |t|
    t.integer  "resource_id"
    t.integer  "classroom_laboratory_id"
    t.integer  "state_id"
    t.string   "codigo"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["classroom_laboratory_id"], name: "index_classroom_laboratory_resources_on_classroom_laboratory_id", using: :btree
    t.index ["resource_id"], name: "index_classroom_laboratory_resources_on_resource_id", using: :btree
    t.index ["state_id"], name: "index_classroom_laboratory_resources_on_state_id", using: :btree
  end

  create_table "classroom_laboratory_schedules", force: :cascade do |t|
    t.integer  "classroom_laboratory_id"
    t.integer  "schedule_id"
    t.string   "codigo"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["classroom_laboratory_id"], name: "index_classroom_laboratory_schedules_on_classroom_laboratory_id", using: :btree
    t.index ["schedule_id"], name: "index_classroom_laboratory_schedules_on_schedule_id", using: :btree
  end

  create_table "coh_per_sub_us", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.string   "allDay"
    t.integer  "cohort_period_id"
    t.integer  "subject_user_id"
    t.integer  "schedule_cohort_period_id"
    t.integer  "subject_regimen_duration_id"
    t.string   "codigo"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["cohort_period_id"], name: "index_coh_per_sub_us_on_cohort_period_id", using: :btree
    t.index ["schedule_cohort_period_id"], name: "index_coh_per_sub_us_on_schedule_cohort_period_id", using: :btree
    t.index ["subject_regimen_duration_id"], name: "index_coh_per_sub_us_on_subject_regimen_duration_id", using: :btree
    t.index ["subject_user_id"], name: "index_coh_per_sub_us_on_subject_user_id", using: :btree
  end

  create_table "cohort_period_users", force: :cascade do |t|
    t.integer  "cohort_period_id"
    t.integer  "cohort_user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cohort_period_id"], name: "index_cohort_period_users_on_cohort_period_id", using: :btree
    t.index ["cohort_user_id"], name: "index_cohort_period_users_on_cohort_user_id", using: :btree
  end

  create_table "cohort_periods", force: :cascade do |t|
    t.integer  "cohort_program_id"
    t.integer  "period_id"
    t.integer  "regimen_duration_id"
    t.string   "codigo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["cohort_program_id"], name: "index_cohort_periods_on_cohort_program_id", using: :btree
    t.index ["period_id"], name: "index_cohort_periods_on_period_id", using: :btree
    t.index ["regimen_duration_id"], name: "index_cohort_periods_on_regimen_duration_id", using: :btree
  end

  create_table "cohort_programs", force: :cascade do |t|
    t.integer  "cohort_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_cohort_programs_on_cohort_id", using: :btree
    t.index ["program_id"], name: "index_cohort_programs_on_program_id", using: :btree
  end

  create_table "cohort_users", force: :cascade do |t|
    t.integer  "cohort_program_id"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["cohort_program_id"], name: "index_cohort_users_on_cohort_program_id", using: :btree
    t.index ["user_id"], name: "index_cohort_users_on_user_id", using: :btree
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "collection_programs", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "collection_id"
    t.string   "codigo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["collection_id"], name: "index_collection_programs_on_collection_id", using: :btree
    t.index ["program_id"], name: "index_collection_programs_on_program_id", using: :btree
  end

  create_table "collections", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contact_abouts", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "email"
    t.string   "descripcion"
    t.integer  "type_contact_id"
    t.integer  "contact_about_id"
    t.integer  "program_id"
    t.integer  "area_interest_id"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["area_interest_id"], name: "index_contacts_on_area_interest_id", using: :btree
    t.index ["contact_about_id"], name: "index_contacts_on_contact_about_id", using: :btree
    t.index ["program_id"], name: "index_contacts_on_program_id", using: :btree
    t.index ["type_contact_id"], name: "index_contacts_on_type_contact_id", using: :btree
  end

  create_table "day_weeks", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "defending_theses", force: :cascade do |t|
    t.integer  "thesis_id"
    t.date     "fecha"
    t.time     "hora"
    t.string   "lugar"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.text     "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "postgraduate_coordination_id"
    t.string   "codigo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["postgraduate_coordination_id"], name: "index_emails_on_postgraduate_coordination_id", using: :btree
  end

  create_table "estados", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "eva_comm_projs", force: :cascade do |t|
    t.string   "principal_1"
    t.string   "principal_2"
    t.string   "principal_3"
    t.string   "suplente_1"
    t.string   "coordinador"
    t.integer  "project_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_eva_comm_projs_on_project_id", using: :btree
  end

  create_table "eva_comm_theses", force: :cascade do |t|
    t.string   "principal_1"
    t.string   "principal_2"
    t.string   "principal_3"
    t.string   "suplente_1"
    t.string   "suplente_2"
    t.string   "suplente_3"
    t.string   "coordinador"
    t.integer  "thesis_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["thesis_id"], name: "index_eva_comm_theses_on_thesis_id", using: :btree
  end

  create_table "eventos", force: :cascade do |t|
    t.string   "tittle"
    t.string   "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "end"
    t.string   "color"
    t.string   "aula"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "solicitante"
  end

  create_table "find_outs", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "funcions", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "id_padre"
    t.string   "estatus"
    t.string   "url"
    t.string   "id_funcion"
    t.string   "codigo"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "graduate_profiles", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "program_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["program_id"], name: "index_graduate_profiles_on_program_id", using: :btree
  end

  create_table "history_notes", force: :cascade do |t|
    t.string   "cohorte"
    t.string   "periodo"
    t.string   "participante"
    t.string   "materia"
    t.string   "nota"
    t.string   "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "interesteds", force: :cascade do |t|
    t.string   "nombre"
    t.string   "email"
    t.string   "telefono"
    t.integer  "program_id"
    t.integer  "area_interest_id"
    t.string   "descripcion"
    t.integer  "detail_id"
    t.integer  "find_out_id"
    t.integer  "why_dcyt_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["area_interest_id"], name: "index_interesteds_on_area_interest_id", using: :btree
    t.index ["detail_id"], name: "index_interesteds_on_detail_id", using: :btree
    t.index ["find_out_id"], name: "index_interesteds_on_find_out_id", using: :btree
    t.index ["program_id"], name: "index_interesteds_on_program_id", using: :btree
    t.index ["why_dcyt_id"], name: "index_interesteds_on_why_dcyt_id", using: :btree
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "thesis_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["thesis_id"], name: "index_keywords_on_thesis_id", using: :btree
  end

  create_table "line_investigations", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "program_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["program_id"], name: "index_line_investigations_on_program_id", using: :btree
  end

  create_table "modalities", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "codigo"
    t.string   "estado"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "tittle"
    t.string   "event"
    t.boolean  "viewed"
    t.string   "id_user"
    t.string   "id_publisher"
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "objectives", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "postgraduate_coordination_id"
    t.string   "codigo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["postgraduate_coordination_id"], name: "index_objectives_on_postgraduate_coordination_id", using: :btree
  end

  create_table "offer_users", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_users_on_offer_id", using: :btree
    t.index ["user_id"], name: "index_offer_users_on_user_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.string   "titulo"
    t.date     "fecha_hasta"
    t.date     "fecha_desde"
    t.date     "fecha_inscripcion"
    t.integer  "program_id"
    t.string   "codigo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["program_id"], name: "index_offers_on_program_id", using: :btree
  end

  create_table "opinions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "type_opinion_id"
    t.string   "codigo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["type_opinion_id"], name: "index_opinions_on_type_opinion_id", using: :btree
    t.index ["user_id"], name: "index_opinions_on_user_id", using: :btree
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer  "academic_degree_id"
    t.integer  "speciality_id"
    t.string   "codigo"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["academic_degree_id"], name: "index_ownerships_on_academic_degree_id", using: :btree
    t.index ["speciality_id"], name: "index_ownerships_on_speciality_id", using: :btree
  end

  create_table "periods", force: :cascade do |t|
    t.string   "fecha_desde"
    t.string   "fecha_hasta"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "numero"
    t.integer  "postgraduate_coordination_id"
    t.string   "codigo"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["postgraduate_coordination_id"], name: "index_phones_on_postgraduate_coordination_id", using: :btree
  end

  create_table "poll_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_poll_users_on_poll_id", using: :btree
    t.index ["user_id"], name: "index_poll_users_on_user_id", using: :btree
  end

  create_table "polls", force: :cascade do |t|
    t.string   "descripcion"
    t.integer  "type_poll_id"
    t.string   "codigo"
    t.string   "estatus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "activado"
    t.index ["type_poll_id"], name: "index_polls_on_type_poll_id", using: :btree
  end

  create_table "postgraduate_coordinations", force: :cascade do |t|
    t.text     "descripcion"
    t.text     "mision"
    t.text     "vision"
    t.string   "direccion"
    t.integer  "city_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["city_id"], name: "index_postgraduate_coordinations_on_city_id", using: :btree
  end

  create_table "postulate_area_interests", force: :cascade do |t|
    t.integer  "area_interest_id"
    t.integer  "postulate_id"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["area_interest_id"], name: "index_postulate_area_interests_on_area_interest_id", using: :btree
    t.index ["postulate_id"], name: "index_postulate_area_interests_on_postulate_id", using: :btree
  end

  create_table "postulate_collection_programs", force: :cascade do |t|
    t.integer  "postulate_id"
    t.integer  "collection_program_id"
    t.boolean  "estado"
    t.string   "codigo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["collection_program_id"], name: "index_postulate_collection_programs_on_collection_program_id", using: :btree
    t.index ["postulate_id"], name: "index_postulate_collection_programs_on_postulate_id", using: :btree
  end

  create_table "postulate_collections", force: :cascade do |t|
    t.integer  "postulate_id"
    t.integer  "collection_id"
    t.string   "codigo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["collection_id"], name: "index_postulate_collections_on_collection_id", using: :btree
    t.index ["postulate_id"], name: "index_postulate_collections_on_postulate_id", using: :btree
  end

  create_table "postulates", force: :cascade do |t|
    t.string   "nombre"
    t.string   "cedula"
    t.string   "direccion"
    t.string   "sexo"
    t.string   "telefono"
    t.string   "fecha_nacimiento"
    t.string   "email"
    t.string   "estado_civil"
    t.string   "decision"
    t.integer  "offer_id"
    t.integer  "find_out_id"
    t.integer  "city_id"
    t.integer  "detail_id"
    t.integer  "institution_id"
    t.integer  "why_dcyt_id"
    t.integer  "ownership_id"
    t.integer  "area_interest_id"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "sex_id"
    t.integer  "civil_status_id"
    t.index ["area_interest_id"], name: "index_postulates_on_area_interest_id", using: :btree
    t.index ["city_id"], name: "index_postulates_on_city_id", using: :btree
    t.index ["civil_status_id"], name: "index_postulates_on_civil_status_id", using: :btree
    t.index ["detail_id"], name: "index_postulates_on_detail_id", using: :btree
    t.index ["find_out_id"], name: "index_postulates_on_find_out_id", using: :btree
    t.index ["institution_id"], name: "index_postulates_on_institution_id", using: :btree
    t.index ["offer_id"], name: "index_postulates_on_offer_id", using: :btree
    t.index ["ownership_id"], name: "index_postulates_on_ownership_id", using: :btree
    t.index ["sex_id"], name: "index_postulates_on_sex_id", using: :btree
    t.index ["why_dcyt_id"], name: "index_postulates_on_why_dcyt_id", using: :btree
  end

  create_table "program_califications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.string   "comment"
    t.integer  "calification"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["program_id"], name: "index_program_califications_on_program_id", using: :btree
    t.index ["user_id"], name: "index_program_califications_on_user_id", using: :btree
  end

  create_table "program_collections", force: :cascade do |t|
    t.integer  "program_id"
    t.integer  "collection_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["collection_id"], name: "index_program_collections_on_collection_id", using: :btree
    t.index ["program_id"], name: "index_program_collections_on_program_id", using: :btree
  end

  create_table "program_subjects", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_program_subjects_on_program_id", using: :btree
    t.index ["subject_id"], name: "index_program_subjects_on_subject_id", using: :btree
  end

  create_table "programs", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.string   "duracion"
    t.string   "grado_egresado"
    t.integer  "regimen_study_id"
    t.integer  "modality_id"
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["modality_id"], name: "index_programs_on_modality_id", using: :btree
    t.index ["regimen_study_id"], name: "index_programs_on_regimen_study_id", using: :btree
    t.index ["user_id"], name: "index_programs_on_user_id", using: :btree
  end

  create_table "project_area_interests", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "area_interest_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["area_interest_id"], name: "index_project_area_interests_on_area_interest_id", using: :btree
    t.index ["project_id"], name: "index_project_area_interests_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "tutor"
    t.string   "titulo"
    t.integer  "user_id"
    t.integer  "line_investigation_id"
    t.string   "codigo"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["line_investigation_id"], name: "index_projects_on_line_investigation_id", using: :btree
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "question_answers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["answer_id"], name: "index_question_answers_on_answer_id", using: :btree
    t.index ["question_id"], name: "index_question_answers_on_question_id", using: :btree
  end

  create_table "question_polls", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "poll_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["poll_id"], name: "index_question_polls_on_poll_id", using: :btree
    t.index ["question_id"], name: "index_question_polls_on_question_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reasons", force: :cascade do |t|
    t.string   "descipcion"
    t.integer  "type_reason_id"
    t.integer  "request_class_lab_id"
    t.string   "codigo"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["request_class_lab_id"], name: "index_reasons_on_request_class_lab_id", using: :btree
    t.index ["type_reason_id"], name: "index_reasons_on_type_reason_id", using: :btree
  end

  create_table "regimen_durations", force: :cascade do |t|
    t.integer  "program_id"
    t.string   "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_regimen_durations_on_program_id", using: :btree
  end

  create_table "regimen_studies", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "request_class_labs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "classroom_laboratory_schedule_id"
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "classroom_laboratory_id"
    t.integer  "defending_thesis_id"
    t.string   "status",                           default: "0"
    t.datetime "start"
    t.datetime "end"
    t.string   "solicitante"
    t.index ["classroom_laboratory_id"], name: "index_request_class_labs_on_classroom_laboratory_id", using: :btree
    t.index ["classroom_laboratory_schedule_id"], name: "index_request_class_labs_on_classroom_laboratory_schedule_id", using: :btree
    t.index ["defending_thesis_id"], name: "index_request_class_labs_on_defending_thesis_id", using: :btree
    t.index ["user_id"], name: "index_request_class_labs_on_user_id", using: :btree
  end

  create_table "request_responses", force: :cascade do |t|
    t.integer  "type_req_resp_id"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["type_req_resp_id"], name: "index_request_responses_on_type_req_resp_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "type_request_id"
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["type_request_id"], name: "index_requests_on_type_request_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "resources", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "results", force: :cascade do |t|
    t.text     "descripcion"
    t.integer  "thesis_id"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["thesis_id"], name: "index_results_on_thesis_id", using: :btree
  end

  create_table "review_projects", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "type_review_id"
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["project_id"], name: "index_review_projects_on_project_id", using: :btree
    t.index ["type_review_id"], name: "index_review_projects_on_type_review_id", using: :btree
  end

  create_table "review_theses", force: :cascade do |t|
    t.integer  "thesis_id"
    t.integer  "type_review_id"
    t.string   "codigo"
    t.string   "descripcion"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["thesis_id"], name: "index_review_theses_on_thesis_id", using: :btree
    t.index ["type_review_id"], name: "index_review_theses_on_type_review_id", using: :btree
  end

  create_table "role_funcions", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "funcion_id"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcion_id"], name: "index_role_funcions_on_funcion_id", using: :btree
    t.index ["role_id"], name: "index_role_funcions_on_role_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "estado"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sch_per_us", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "coh_per_sub_u_id"
    t.string   "nota"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["coh_per_sub_u_id"], name: "index_sch_per_us_on_coh_per_sub_u_id", using: :btree
    t.index ["user_id"], name: "index_sch_per_us_on_user_id", using: :btree
  end

  create_table "schedule_cohort_periods", force: :cascade do |t|
    t.integer  "schedule_id"
    t.integer  "cohort_period_id"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["cohort_period_id"], name: "index_schedule_cohort_periods_on_cohort_period_id", using: :btree
    t.index ["schedule_id"], name: "index_schedule_cohort_periods_on_schedule_id", using: :btree
  end

  create_table "schedules", force: :cascade do |t|
    t.date     "fecha"
    t.time     "hora_inicio"
    t.time     "hora_final"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "classroom_laboratory_schedule_id"
    t.integer  "coh_per_sub_u_id"
    t.string   "codigo"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["classroom_laboratory_schedule_id"], name: "index_sessions_on_classroom_laboratory_schedule_id", using: :btree
    t.index ["coh_per_sub_u_id"], name: "index_sessions_on_coh_per_sub_u_id", using: :btree
  end

  create_table "sexes", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "social_widgets", force: :cascade do |t|
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sub_per_users", force: :cascade do |t|
    t.string   "nota"
    t.integer  "user_id"
    t.integer  "coh_per_sub_u_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["coh_per_sub_u_id"], name: "index_sub_per_users_on_coh_per_sub_u_id", using: :btree
    t.index ["user_id"], name: "index_sub_per_users_on_user_id", using: :btree
  end

  create_table "subject_regimen_durations", force: :cascade do |t|
    t.integer  "regimen_duration_id"
    t.integer  "subject_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["regimen_duration_id"], name: "index_subject_regimen_durations_on_regimen_duration_id", using: :btree
    t.index ["subject_id"], name: "index_subject_regimen_durations_on_subject_id", using: :btree
  end

  create_table "subject_users", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_subject_users_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_subject_users_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.string   "unidades_credito"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "type_subject_id"
    t.index ["type_subject_id"], name: "index_subjects_on_type_subject_id", using: :btree
  end

  create_table "survey_response_questions", force: :cascade do |t|
    t.integer  "survey_response_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["answer_id"], name: "index_survey_response_questions_on_answer_id", using: :btree
    t.index ["question_id"], name: "index_survey_response_questions_on_question_id", using: :btree
    t.index ["survey_response_id"], name: "index_survey_response_questions_on_survey_response_id", using: :btree
  end

  create_table "survey_responses", force: :cascade do |t|
    t.integer  "poll_id"
    t.string   "sexo"
    t.string   "edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_survey_responses_on_poll_id", using: :btree
  end

  create_table "systems", force: :cascade do |t|
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "theses", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "codigo"
    t.string   "titulo"
    t.integer  "user_id"
    t.integer  "line_investigation_id"
    t.string   "tutor"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["line_investigation_id"], name: "index_theses_on_line_investigation_id", using: :btree
    t.index ["project_id"], name: "index_theses_on_project_id", using: :btree
    t.index ["user_id"], name: "index_theses_on_user_id", using: :btree
  end

  create_table "tracings", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "descripcion"
    t.string   "codigo"
    t.integer  "thesis_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_tracings_on_project_id", using: :btree
    t.index ["thesis_id"], name: "index_tracings_on_thesis_id", using: :btree
  end

  create_table "tutors", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutors_on_user_id", using: :btree
  end

  create_table "type_certificates", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_contacts", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_news", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_opinions", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_poll_roles", force: :cascade do |t|
    t.integer  "type_poll_id"
    t.integer  "role_id"
    t.string   "codigo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["role_id"], name: "index_type_poll_roles_on_role_id", using: :btree
    t.index ["type_poll_id"], name: "index_type_poll_roles_on_type_poll_id", using: :btree
  end

  create_table "type_polls", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_reasons", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_req_resps", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_requests", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_reviews", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_sliders", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_status_certificates", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "type_subjects", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_area_interests", force: :cascade do |t|
    t.integer  "area_interest_id"
    t.integer  "user_id"
    t.string   "codigo"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["area_interest_id"], name: "index_user_area_interests_on_area_interest_id", using: :btree
    t.index ["user_id"], name: "index_user_area_interests_on_user_id", using: :btree
  end

  create_table "user_collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "collection_id"
    t.string   "codigo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["collection_id"], name: "index_user_collections_on_collection_id", using: :btree
    t.index ["user_id"], name: "index_user_collections_on_user_id", using: :btree
  end

  create_table "user_ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "ownership_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["ownership_id"], name: "index_user_ownerships_on_ownership_id", using: :btree
    t.index ["user_id"], name: "index_user_ownerships_on_user_id", using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.string   "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "nombre"
    t.string   "cedula"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "fecha_nacimiento"
    t.integer  "role_id"
    t.integer  "line_investigation_id"
    t.integer  "cohort_program_id"
    t.integer  "sex_id"
    t.integer  "civil_status_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["civil_status_id"], name: "index_users_on_civil_status_id", using: :btree
    t.index ["cohort_program_id"], name: "index_users_on_cohort_program_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["line_investigation_id"], name: "index_users_on_line_investigation_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
    t.index ["sex_id"], name: "index_users_on_sex_id", using: :btree
  end

  create_table "why_dcyts", force: :cascade do |t|
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "area_interests", "line_investigations"
  add_foreign_key "certificates", "type_certificates"
  add_foreign_key "certificates", "type_status_certificates"
  add_foreign_key "certificates", "users"
  add_foreign_key "cities", "estados"
  add_foreign_key "classroom_laboratory_resources", "classroom_laboratories"
  add_foreign_key "classroom_laboratory_resources", "resources"
  add_foreign_key "classroom_laboratory_resources", "states"
  add_foreign_key "classroom_laboratory_schedules", "classroom_laboratories"
  add_foreign_key "classroom_laboratory_schedules", "schedules"
  add_foreign_key "coh_per_sub_us", "cohort_periods"
  add_foreign_key "coh_per_sub_us", "schedule_cohort_periods"
  add_foreign_key "coh_per_sub_us", "subject_regimen_durations"
  add_foreign_key "coh_per_sub_us", "subject_users"
  add_foreign_key "cohort_period_users", "cohort_periods"
  add_foreign_key "cohort_period_users", "cohort_users"
  add_foreign_key "cohort_periods", "cohort_programs"
  add_foreign_key "cohort_periods", "periods"
  add_foreign_key "cohort_periods", "regimen_durations"
  add_foreign_key "cohort_programs", "cohorts"
  add_foreign_key "cohort_programs", "programs"
  add_foreign_key "cohort_users", "cohort_programs"
  add_foreign_key "cohort_users", "users"
  add_foreign_key "collection_programs", "collections"
  add_foreign_key "collection_programs", "programs"
  add_foreign_key "contacts", "area_interests"
  add_foreign_key "contacts", "contact_abouts"
  add_foreign_key "contacts", "programs"
  add_foreign_key "contacts", "type_contacts"
  add_foreign_key "emails", "postgraduate_coordinations"
  add_foreign_key "eva_comm_projs", "projects"
  add_foreign_key "eva_comm_theses", "theses"
  add_foreign_key "graduate_profiles", "programs"
  add_foreign_key "interesteds", "area_interests"
  add_foreign_key "interesteds", "details"
  add_foreign_key "interesteds", "find_outs"
  add_foreign_key "interesteds", "programs"
  add_foreign_key "interesteds", "why_dcyts"
  add_foreign_key "keywords", "theses"
  add_foreign_key "line_investigations", "programs"
  add_foreign_key "objectives", "postgraduate_coordinations"
  add_foreign_key "offer_users", "offers"
  add_foreign_key "offer_users", "users"
  add_foreign_key "offers", "programs"
  add_foreign_key "opinions", "type_opinions"
  add_foreign_key "opinions", "users"
  add_foreign_key "ownerships", "academic_degrees"
  add_foreign_key "ownerships", "specialities"
  add_foreign_key "phones", "postgraduate_coordinations"
  add_foreign_key "poll_users", "polls"
  add_foreign_key "poll_users", "users"
  add_foreign_key "polls", "type_polls"
  add_foreign_key "postgraduate_coordinations", "cities"
  add_foreign_key "postulate_area_interests", "area_interests"
  add_foreign_key "postulate_area_interests", "postulates"
  add_foreign_key "postulate_collection_programs", "collection_programs"
  add_foreign_key "postulate_collection_programs", "postulates"
  add_foreign_key "postulate_collections", "collections"
  add_foreign_key "postulate_collections", "postulates"
  add_foreign_key "postulates", "area_interests"
  add_foreign_key "postulates", "cities"
  add_foreign_key "postulates", "civil_statuses"
  add_foreign_key "postulates", "details"
  add_foreign_key "postulates", "find_outs"
  add_foreign_key "postulates", "institutions"
  add_foreign_key "postulates", "offers"
  add_foreign_key "postulates", "ownerships"
  add_foreign_key "postulates", "sexes"
  add_foreign_key "postulates", "why_dcyts"
  add_foreign_key "program_collections", "collections"
  add_foreign_key "program_collections", "programs"
  add_foreign_key "program_subjects", "programs"
  add_foreign_key "program_subjects", "subjects"
  add_foreign_key "programs", "modalities"
  add_foreign_key "programs", "regimen_studies"
  add_foreign_key "programs", "users"
  add_foreign_key "project_area_interests", "area_interests"
  add_foreign_key "project_area_interests", "projects"
  add_foreign_key "projects", "line_investigations"
  add_foreign_key "projects", "users"
  add_foreign_key "question_answers", "answers"
  add_foreign_key "question_answers", "questions"
  add_foreign_key "question_polls", "polls"
  add_foreign_key "question_polls", "questions"
  add_foreign_key "reasons", "request_class_labs"
  add_foreign_key "reasons", "type_reasons"
  add_foreign_key "regimen_durations", "programs"
  add_foreign_key "request_class_labs", "classroom_laboratories"
  add_foreign_key "request_class_labs", "classroom_laboratory_schedules"
  add_foreign_key "request_class_labs", "defending_theses"
  add_foreign_key "request_class_labs", "users"
  add_foreign_key "request_responses", "type_req_resps"
  add_foreign_key "requests", "type_requests"
  add_foreign_key "requests", "users"
  add_foreign_key "results", "theses"
  add_foreign_key "review_projects", "projects"
  add_foreign_key "review_projects", "type_reviews"
  add_foreign_key "review_theses", "theses"
  add_foreign_key "review_theses", "type_reviews"
  add_foreign_key "role_funcions", "funcions"
  add_foreign_key "role_funcions", "roles"
  add_foreign_key "sch_per_us", "coh_per_sub_us"
  add_foreign_key "sch_per_us", "users"
  add_foreign_key "schedule_cohort_periods", "cohort_periods"
  add_foreign_key "schedule_cohort_periods", "schedules"
  add_foreign_key "sessions", "classroom_laboratory_schedules"
  add_foreign_key "sessions", "coh_per_sub_us"
  add_foreign_key "sub_per_users", "coh_per_sub_us"
  add_foreign_key "sub_per_users", "users"
  add_foreign_key "subject_regimen_durations", "regimen_durations"
  add_foreign_key "subject_regimen_durations", "subjects"
  add_foreign_key "subject_users", "subjects"
  add_foreign_key "subject_users", "users"
  add_foreign_key "subjects", "type_subjects"
  add_foreign_key "survey_response_questions", "answers"
  add_foreign_key "survey_response_questions", "questions"
  add_foreign_key "survey_response_questions", "survey_responses"
  add_foreign_key "survey_responses", "polls"
  add_foreign_key "theses", "line_investigations"
  add_foreign_key "theses", "projects"
  add_foreign_key "theses", "users"
  add_foreign_key "tracings", "projects"
  add_foreign_key "tracings", "theses"
  add_foreign_key "tutors", "users"
  add_foreign_key "type_poll_roles", "roles"
  add_foreign_key "type_poll_roles", "type_polls"
  add_foreign_key "user_area_interests", "area_interests"
  add_foreign_key "user_area_interests", "users"
  add_foreign_key "user_collections", "collections"
  add_foreign_key "user_collections", "users"
  add_foreign_key "user_ownerships", "ownerships"
  add_foreign_key "user_ownerships", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "users", "civil_statuses"
  add_foreign_key "users", "cohort_programs"
  add_foreign_key "users", "line_investigations"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "sexes"
end
