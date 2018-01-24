Myapp::Application.routes.draw do
  resources :civil_statuses
  resources :sexes
  resources :survey_response_questions, only: [:index, :new, :edit, :create, :update]
  resources :survey_responses, only: [:index, :new, :edit, :create, :update]
  resources :program_califications do
    get :calificar_programa, on: :collection
    post :calificar_programa, on: :collection
  end
  resources :graduate_profiles
  resources :user_ownerships
  resources :events
  resources :reports, :path => 'reportes' do
    post :clasifications, on: :collection
    post :thesis_program, on: :collection
    post :pie, on: :collection, :path => 'pastel'
    post :pie3d, on: :collection
    post :meter, on: :collection
    post :sparkline, on: :collection
    post :venn, on: :collection
    post :bar, on: :collection
    post :scatter, on: :collection
    post :linexy, on: :collection
    post :line, on: :collection
    post :redir, on: :collection
    post :render_program_json, on: :collection
    post :render_genre_poll_json, on: :collection
    post :render_question_answer_json, on: :collection
    post :interested, on: :collection

    get :interested, on: :collection
    get :render_question_answer_json, on: :collection
    get :render_genre_poll_json, on: :collection
    get :render_program_json, on: :collection
    get :pie, on: :collection, :path => 'pastel'
    get :pie3d, on: :collection
    get :meter, on: :collection
    get :sparkline, on: :collection
    get :venn, on: :collection
    get :bar, on: :collection
    get :scatter, on: :collection
    get :linexy, on: :collection
    get :line, on: :collection
    get :redir, on: :collection
  end
  resources :type_status_certificates
  resources :project_area_interests
  resources :cohort_users
  resources :cohort_programs
  resources :subject_regimen_durations
  resources :regimen_durations
  resources :type_certificates
  resources :certificates

  get "postulates/show"


  resources :import_participants
  resources :optimizer
  resources :pool
  resources :interesteds
  resources :institutions
  resources :sub_per_users
  resources :type_subjects
  resources :program_subjects
  resources :regimen_studies
  resources :contacts
  resources :contact_abouts
  resources :type_contacts
  resources :why_dcyts
  resources :day_weeks
  resources :blocks
  resources :offer_users


  resources :eventos
  resources :notifications do
    get  :actualizar_contador, on: :collection
  end
  resources :modalities
  resources :postulate_area_interests
  resources :find_outs
  resources :cities
  resources :estados
  resources :news
  resources :history_notes
  resources :request_responses
  resources :type_req_resps
  resources :tracings
  resources :keywords
  resources :eva_comm_theses
  resources :eva_comm_projs
  resources :defending_theses
  resources :results
  resources :review_projects
  resources :review_theses
  resources :theses
  resources :requests
  resources :user_collections
  resources :projects
  resources :sch_per_us
  resources :sessions
  resources :postulate_collections
  resources :question_polls
  resources :coh_per_sub_us
  resources :request_class_labs
  resources :ownerships
  resources :user_area_interests
  resources :details
  resources :schedule_cohort_periods
  resources :area_interests
  resources :postulate_collection_programs
  resources :subject_users
  resources :postulates, only: [:index, :new, :edit, :create, :update]
  resources :cohort_periods
  resources :reasons
  resources :question_polls
  resources :collection_programs
  resources :line_investigations
  resources :subjects
  resources :cohorts
  resources :offers
  resources :request_classroom_labs
  resources :sliders
  resources :systems
  resources :role_funcions
  resources :funcions
  resources :question_answers
  resources :poll_users
  resources :specialities
  resources :type_poll_roles
  resources :polls do
    post :guardar_encuesta, on: :collection
    get :guardar_encuesta, on: :collection
    get :guardar_encuesta_llenada, on: :collection
    post :guardar_encuesta_llenada, on: :collection
    get :llenar_encuesta, on: :collection
    post :llenar_encuesta, on: :collection
  end
  resources :tutors
  resources :opinions
  resources :programs
  resources :objectives
  resources :phones
  resources :emails
  resources :classroom_laboratory_schedules
  resources :classroom_laboratory_resources
  resources :user_roles
  resources :roles
  devise_for :users
  resources :postgraduate_coordinations
  resources :schedules
  resources :collections
  resources :type_sliders
  resources :type_opinions
  resources :answers
  resources :questions
  resources :type_news
  resources :academic_degrees
  resources :type_requests
  resources :type_reviews
  resources :type_polls
  resources :periods
  resources :type_reasons
  resources :classroom_laboratories
  resources :states
  resources :resources
  resources :users do
    get :current_user_json, on: :collection
    post :current_user_json, on: :collection
  end
  resources :tokens
  resources :logins
  resources :social_widgets
  resources :reports do
    post :pie, on: :collection
    post :pie3d, on: :collection
    post :meter, on: :collection
    post :sparkline, on: :collection
    post :venn, on: :collection
    post :bar, on: :collection
    post :scatter, on: :collection
    post :linexy, on: :collection
    post :line, on: :collection
  end
  resources :users, except: :create
  post 'create_user', :to => 'users#create'
  post 'update_user', :to => 'users#update'
 

  get 'update_user', :to => 'users#update'
  #post "/update_perfil" , :to => "users#update_perfil"
  get "/perfil" , :to => "users#update"
  get "/ficha" , :to => "users#update"
  get "/poll_profesores" , :to => "poll_users#poll_profesores"
  get "/update_poll" , :to => "poll_users#update_poll"
  #|get "/reporte_tipo_contacto" , :to => "type_contacts#reporte_tipo_contacto"
  get "/update_contactos" , :to => "type_contacts#update_contactos"
  get "/form_edit",  :to => "users#form_edit"




  post "/news_image/:id", :to => "news#news_image"
  post "/create_movil", :to => "news#create_movil" 
  get "/encuesta_web", :to => "polls#encuesta_web" 
  post "/agregar", :to => "polls#agregar"
  
  

  resources :maestricos, only: [:index]
  post "maestricos/prueba"
  get "maestricos/prueba"
  get "postulates/chequeo" 
  get "users/chequeo_ficha" 
  get "chequeo",  :to => "postulates#chequeo"
  get "chequeo_ficha",  :to => "users#chequeo_ficha"

  get "admision",  :to => "postulates#admision"
  get "postulates/admision"
  get "postulates/show"
  get '/interestedscreate' ,  :to => "interesteds#create"
  get '/contactscreate' ,  :to => "contacts#create"
  post "users/login_movil"
  get "/asigancion_recursos",  :to => "offers#asigancion_recursos"
  get "/recursos_cohorte",  :to => "offers#recursos_cohorte"
  get "/periodo-regimen",  :to => "offers#regimen"
  get "/postulates/create"
  get "/survey_responses/create"
  get "/survey_response_questions/create"
  post "/guardar_asociacion",  :to => "role_funcions#guardar_asociacion"
  get "/edit_role_funcions",  :to => "role_funcions#editar_asociacion"
  post "/actualizar_asociacion",  :to => "role_funcions#actualizar_asociacion"
  post "/line_investigations/new",  :to => "line_investigations#new"
  get "/recursos_oferta", :to => "offers#recursos_oferta"
  post "/cohort_programs/new"
  post "/area_interests/new"
  get "/select_program",  :to => "program_subjects#select_program"
  post "/theses/new"
  get "/objetivos",  :to => "postgraduate_coordinations#objetivos"



  get "/telefonos",  :to => "postgraduate_coordinations#telefonos"
  get "/correos",  :to => "postgraduate_coordinations#correos"
  get 'configuracion_sistema/index'
  get "/certificate_secretary",  :to => "certificates#certificate_secretary"
  get "/asignacion_recursos",  :to => "cohorts#asignacion_recursos"
  get '/update_lines', :to => 'programs#update_lines'
  get '/update_line_investigation_poll', :to => 'poll_users#update_line_investigation_poll'
  
  get '/update_regimen', :to => 'programs#update_regimen'
  get '/update_cohort', :to => 'cohorts#update_cohort'
  get '/update_cohort_planification', :to => 'cohorts#update_cohort_planification'
  get '/update_cohort_aula', :to => 'cohorts#update_cohort_aula'
  get '/update_cohort_planification_aula', :to => 'cohorts#update_cohort_planification_aula'
  get '/asignacion_recursos', :to => 'cohorts#asignacion_recursos'
  get "/update_areas", :to => "line_investigations#update_areas"
  get '/update_participante', :to => 'projects#update_cohort_program'
  get '/update_area_project', :to => 'projects#update_area_project'
  get '/seguimiento', :to => 'projects#seguimiento'
  get '/mi_proyecto', :to => 'projects#mi_proyecto'
  get '/mi_tesis', :to => 'theses#mi_tesis'
  get '/update_project_tracing', :to => 'projects#update_project_tracing'
  get '/registrartheses', :to => 'theses#registrartheses'
  get '/resultado', :to => 'coh_per_sub_us#resultado'
  get '/update_cohorte_nota', :to => 'coh_per_sub_us#update_cohorte_nota'
  get '/update_cohorte_periodo_nota', :to => 'coh_per_sub_us#update_cohorte_periodo_nota'
  get '/update_cohorte_periodo_materia_nota', :to => 'coh_per_sub_us#update_cohorte_periodo_materia_nota'
  get '/update_participante_nota', :to => 'coh_per_sub_us#update_participante_nota'
  post '/coh_per_sub_us/nota_materia', :to => 'coh_per_sub_us#nota_materia'
  get '/seguimiento1', :to => 'theses#seguimiento1'
  get '/update_thesis_tracing', :to => 'theses#update_thesis_tracing'

  get "/maestricos/edit",  :to => "maestricos#edit"
  get "/registrar_participantes",  :to => "periods#registrar_participantes_periodo"
  get "/pools",  :to => "users#pool"
  post "/pool_tutor", :to => "users#pool_tutor"
  get "/user_area_interest",  :to => "users#area_interest"
  patch "/create_user_areainterest", :to => "users#guardar_area_interest"
  get "/lineas_programa",  :to => "programs#lineas_programas"

  get "/perfil_egresado_programa",  :to => "programs#perfil_egresado_programas" #saul

post "/graduate_profiles/new"
  get "/update_profiles", :to => "programs#update_profiles"

  post "/LineInvestigations", :to => "line_investigations#index"
  get "/area_line", :to => "line_investigations#areas_lineas"
  post "/AreaInterests", :to => "area_interests#index"
  get "/pensum_programa", :to => "programs#pensum_programas"
  post "/PensumPrograms", :to => "regimen_durations#index"
  get "/update_cohorts", :to => "periods#update_cohorts"
  get "/update_periods", :to => "periods#update_periods"
  get "/update_participantes", :to => "periods#update_participantes"
  post "/save_period_users", :to => "periods#save_period_users"
  get "appviews/calendar"
  get "/unseen_movil_notifications/:id", :to => "notifications#unseen_notif_movil"
  get "/all_movil_notifications/:id", :to => "notifications#all_notif_movil"
  get "/view_movil_notifications/:id", :to => "notifications#view_notif_movil"

 get "/titulos_academicos" , :to => "users#titulos_academicos"
  patch "/create_user_titulos", :to => "users#guardar_titulos_academicos"
  
  get "/user_grades/:id", :to => "sub_per_users#user_grades"
  get "/user_project/:id", :to => "projects#user_project"
  get "/project_tracings/:id", :to => "tracings#project_tracings"
  get "/user_thesis/:id", :to => "theses#user_thesis"
  get "/thesis_tracings/:id", :to => "tracings#thesis_tracings"
  get "/thesis_defense/:id", :to => "defending_theses#thesis_defense"
  get "/user_certificates/:id", :to => "certificates#user_certificates"
  get "/get_type_status_certificate/:id", :to => "certificates#get_type_status_certificate"



  #saul
  get "reporte_postulados_pordia",  :to => "postulates#reporte_postulados_pordia"
get "reporte_tipo_contacto",  :to => "contacts#reporte_tipo_contacto"
  #post "/users/update"
  #get  "/update_perfil" , :to => "users#update_perfil"

  # You can have the root of your site routed with "root"
  root to: 'pages#index'
  get "grafica_encuesta",  :to => "polls#grafica_encuesta"

  # Websockets resemble this URL
  mount ActionCable.server => '/cable'



devise_scope :user do
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

end
