class InsertFunctions < ActiveRecord::Migration[5.0]
  def change

    # Option Principal 1
    Funcion.create(:id_funcion =>'F01',:descripcion => 'Ofertas',:id_padre => nil,:estatus => 1, :url => '')
      # Options
      Funcion.create(:id_funcion =>'F02',:descripcion =>'Registrar Oferta de Programa',:id_padre =>'F01',:estatus =>1,:url =>'/offers')
      Funcion.create(:id_funcion =>'F03',:descripcion =>'Admisión de Postulado',:id_padre =>'F01',:estatus =>1,:url =>'/postulates')
      Funcion.create(:id_funcion =>'F04',:descripcion =>'Asignar Recursos a la Oferta',:id_padre =>'F01',:estatus =>1,:url =>'/recursos_oferta')

    # Option Principal 2
    Funcion.create(:id_funcion =>'F05',:descripcion =>'Operaciones',:id_padre =>nil,:estatus =>1,:url =>'',)
      # Options
      Funcion.create(:id_funcion =>'F06',:descripcion =>'Registrar Planificación de la Cohorte',:id_padre =>'F05',:estatus =>1,:url =>'/cohorts')
      Funcion.create(:id_funcion =>'F07',:descripcion =>'Asignación de Recursos a la Cohorte',:id_padre =>'F05',:estatus =>1,:url =>'/asignacion_recursos')
      Funcion.create(:id_funcion =>'F08',:descripcion =>'Registrar Participantes en el Periodo',:id_padre =>'F05',:estatus =>1,:url =>'/registrar_participantes')
      Funcion.create(:id_funcion =>'F09',:descripcion =>'Registrar Resultados',:id_padre =>'F05',:estatus =>1,:url =>'/resultado')
      Funcion.create(:id_funcion =>'F10',:descripcion =>'Ver Ficha',:id_padre =>'F05',:estatus =>1,:url =>'/tokens')

    # Option Principal 3
    Funcion.create(:id_funcion => 'F11',:descripcion =>'Proyecto/Tesis/TEG',:id_padre => nil,:estatus => 1,:url => '')
      # Submenu 1
      Funcion.create(:id_funcion => 'F12',:descripcion =>'Proyecto',:id_padre => 'F11',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F13',:descripcion =>'Registrar Proyecto',:id_padre => 'F12',:estatus => 1,:url => '/projects')
        Funcion.create(:id_funcion => 'F14',:descripcion =>'Registrar Comisión Evaluadora',:id_padre => 'F12',:estatus => 1,:url => '/eva_comm_projs')
        Funcion.create(:id_funcion => 'F15',:descripcion =>'Registrar Evaluación',:id_padre => 'F12',:estatus => 1,:url => '/review_projects')
        Funcion.create(:id_funcion => 'F101',:descripcion =>'Mi Proyecto',:id_padre => 'F12',:estatus => 1,:url => '/mi_proyecto')
        Funcion.create(:id_funcion => 'F16',:descripcion =>'Seguimiento del Proyecto',:id_padre => 'F12',:estatus => 1,:url => '/seguimiento')
      # Submenu 2
      Funcion.create(:id_funcion => 'F17',:descripcion =>'Tesis/TEG',:id_padre => 'F11',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F18',:descripcion =>'Registrar Tesis/TEG',:id_padre => 'F17',:estatus => 1,:url => '/theses')
        Funcion.create(:id_funcion => 'F19',:descripcion =>'Registrar Jurado Evaluador',:id_padre => 'F17',:estatus => 1,:url => '/eva_comm_theses')
        Funcion.create(:id_funcion => 'F20',:descripcion =>'Registrar Evaluación',:id_padre => 'F17',:estatus => 1,:url => '/review_theses')
        Funcion.create(:id_funcion => 'F21',:descripcion =>'Registrar Defensa',:id_padre => 'F17',:estatus => 1,:url => '/defending_theses')
        Funcion.create(:id_funcion => 'F21',:descripcion =>'Mi Tesis/TEG',:id_padre => 'F17',:estatus => 1,:url => '/mi_tesis')
        Funcion.create(:id_funcion => 'F22',:descripcion =>'Seguimiento de la Tesis/TEG',:id_padre => 'F17',:estatus => 1,:url => '/seguimiento1')
    
    # Option Principal 4
    Funcion.create(:id_funcion => 'F23',:descripcion =>'Aulas/Laboratorios',:id_padre => nil,:estatus => 1,:url => '')
      # Options
      Funcion.create(:id_funcion => 'F24',:descripcion =>'Registrar Solicitud de Reserva',:id_padre => 'F23',:estatus => 1,:url => '/request_class_labs')
      Funcion.create(:id_funcion => 'F25',:descripcion =>'Calendario',:id_padre => 'F23',:estatus => 1,:url => '/appviews/calendar')
      #Funcion.create(:id_funcion => 'F26',:descripcion =>'Cancelar Reserva',:id_padre => 'F23',:estatus => 1,:url => '')
    
    # Option Principal 5
    Funcion.create(:id_funcion => 'F27',:descripcion =>'Servicios',:id_padre => nil,:estatus => 1,:url => '')
      #Options
      Funcion.create(:id_funcion => 'F28',:descripcion =>'Constancias',:id_padre => 'F27',:estatus => 1,:url => '/certificates')
      
    # Option Principal 5
    Funcion.create(:id_funcion => 'F30',:descripcion =>'Reportes y Consultas',:id_padre => nil,:estatus => 1,:url => '')
      # Submenu 1
      Funcion.create(:id_funcion => 'F31',:descripcion =>'Estructurados',:id_padre => 'F30',:estatus => 1,:url => '')
        # Option
        Funcion.create(:id_funcion => 'F32',:descripcion =>'Pools de Profesores',:id_padre => 'F31',:estatus => 1,:url => '/poll_profesores')
      # Submenu 2
      Funcion.create(:id_funcion => 'F33',:descripcion =>'No Estructurados',:id_padre => 'F30',:estatus => 1,:url => '')
        # Option
        Funcion.create(:id_funcion => 'F34',:descripcion =>'======',:id_padre => 'F33',:estatus => 1,:url => '')
      # Submenu 3
      Funcion.create(:id_funcion => 'F35',:descripcion =>'Estadísticos',:id_padre => 'F30',:estatus => 1,:url => '')
        # Option
        Funcion.create(:id_funcion => 'F36',:descripcion =>'Reportes Estadísticos',:id_padre => 'F35',:estatus => 1,:url => '/reports')

    # Option Principal 6
    Funcion.create(:id_funcion => 'F37',:descripcion =>'Difusión y Escucha al Cliente',:id_padre => nil,:estatus => 1,:url => '')
      #Options
      Funcion.create(:id_funcion => 'F38',:descripcion =>'Cartelera de Noticia',:id_padre => 'F37',:estatus => 1,:url => '/news')
      Funcion.create(:id_funcion => 'F39',:descripcion =>'Crear Noticia',:id_padre => 'F37',:estatus => 1,:url => '/news/new')
      Funcion.create(:id_funcion => 'F41',:descripcion =>'Crear Encuesta',:id_padre => 'F37',:estatus => 1,:url => '/polls')
      Funcion.create(:id_funcion => 'F42',:descripcion =>'Contacto',:id_padre => 'F37',:estatus => 1,:url => '/contacts')
      Funcion.create(:id_funcion => 'F43',:descripcion =>'Interesados',:id_padre => 'F37',:estatus => 1,:url => '/interesteds')

    # Option Principal 7
    Funcion.create(:id_funcion => 'F44',:descripcion =>'Configuración',:id_padre => nil,:estatus => 1,:url => '')
      #Option
      Funcion.create(:id_funcion => 'F45',:descripcion =>'Sistema',:id_padre => 'F44',:estatus => 1,:url => '/configuracion_sistema/index')
      # Submenu 1
      Funcion.create(:id_funcion => 'F46',:descripcion =>'Web',:id_padre => 'F44',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F47',:descripcion =>'Slider Principal',:id_padre => 'F46',:estatus => 1,:url => '/sliders')
        Funcion.create(:id_funcion => 'F48',:descripcion =>'Widget Sociales',:id_padre => 'F46',:estatus => 1,:url => '/social_widgets')
        Funcion.create(:id_funcion => 'F49',:descripcion =>'Cartelera de Noticias',:id_padre => 'F46',:estatus => 1,:url => '/encuesta_web')
      # Submenu 2
      Funcion.create(:id_funcion => 'F50',:descripcion =>'Utilidades del Sistema',:id_padre => 'F44',:estatus => 1,:url => '')
        #Options
        Funcion.create(:id_funcion => 'F51',:descripcion =>'Respaldo y Recuperación',:id_padre => 'F50',:estatus => 1,:url => '')
        Funcion.create(:id_funcion => 'F52',:descripcion =>'Históricos',:id_padre => 'F50',:estatus => 1,:url => '/history_notes')
        Funcion.create(:id_funcion => 'F53',:descripcion =>'Optimizar',:id_padre => 'F50',:estatus => 1,:url => '/optimizer/index')
        Funcion.create(:id_funcion => 'F54',:descripcion =>'Importar Participantes',:id_padre => 'F50',:estatus => 1,:url => '/import_participants')

    # Option Princiapl 8
    Funcion.create(:id_funcion => 'F55',:descripcion =>'Parametrización',:id_padre => nil,:estatus => 1,:url => '')
      # Submenu 1
      Funcion.create(:id_funcion => 'F56',:descripcion =>'Oferta',:id_padre => 'F55',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F57',:descripcion =>'Recaudos',:id_padre => 'F56',:estatus => 1,:url => '/maestricos/prueba?titulo=Recaudo&tabla=Collection')
        Funcion.create(:id_funcion => 'F58',:descripcion =>'Materias',:id_padre => 'F56',:estatus => 1,:url => '/subjects')
        Funcion.create(:id_funcion => 'F59',:descripcion =>'Programas',:id_padre => 'F56',:estatus => 1,:url => '/programs')  
        Funcion.create(:id_funcion => 'F60',:descripcion =>'Pensum de Programas',:id_padre => 'F56',:estatus => 1,:url => '/pensum_programa')  
        Funcion.create(:id_funcion => 'F61',:descripcion =>'Lineas de Investigación',:id_padre => 'F56',:estatus => 1,:url => '/lineas_programa')
        Funcion.create(:id_funcion => 'F62',:descripcion =>'Perfil del Egresado del Programa',:id_padre => 'F56',:estatus => 1,:url => '/perfil_egresado_programa')
      # Submenu 2
      Funcion.create(:id_funcion => 'F63',:descripcion =>'Operaciones',:id_padre => 'F55',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F64',:descripcion =>'Cohorte',:id_padre => 'F63',:estatus => 1,:url => '/maestricos/prueba?titulo=Cohorte&tabla=Cohort')
        Funcion.create(:id_funcion => 'F65',:descripcion =>'Periodos',:id_padre => 'F63',:estatus => 1,:url => '/periods')
      # Submenu 3
      Funcion.create(:id_funcion => 'F66',:descripcion =>'Aulas/Laboratorios',:id_padre => 'F55',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F67',:descripcion =>'Aulas/Laboratorios',:id_padre => 'F66',:estatus => 1,:url => '/maestricos/prueba?titulo=Aulas/Laboratorios&tabla=ClassroomLaboratory')
        Funcion.create(:id_funcion => 'F68',:descripcion =>'Recursos',:id_padre => 'F66',:estatus => 1,:url => '/maestricos/prueba?titulo=Recursos&tabla=resource')
      # Option
      Funcion.create(:id_funcion => 'F69',:descripcion =>'Coordinación',:id_padre => 'F55',:estatus => 1,:url => '/postgraduate_coordinations')
      # Submenu 4
      Funcion.create(:id_funcion => 'F70',:descripcion =>'Parametros',:id_padre => 'F55',:estatus => 1,:url => '')
        # Options
        Funcion.create(:id_funcion => 'F71',:descripcion =>'Tipo de Constancias',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Constancias&tabla=Type_Certificate')
        Funcion.create(:id_funcion => 'F72',:descripcion =>'Especialidad',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Especialidad&tabla=Speciality')
        Funcion.create(:id_funcion => 'F102',:descripcion =>'Sexo',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Sexo&tabla=Sex')
        Funcion.create(:id_funcion => 'F103',:descripcion =>'Estado Civil',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Estado+Civil&tabla=CivilStatus')
        Funcion.create(:id_funcion => 'F104',:descripcion =>'Estado',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Estado&tabla=Estado')
        Funcion.create(:id_funcion => 'F105',:descripcion =>'Ciudad',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Ciudad&tabla=City')
        Funcion.create(:id_funcion => 'F106',:descripcion =>'Títulos Académicos',:id_padre => 'F70',:estatus => 1,:url => '/ownerships')
        Funcion.create(:id_funcion => 'F73',:descripcion =>'Detalle',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Detalle&tabla=Detail')
        Funcion.create(:id_funcion => 'F74',:descripcion =>'Institución Académica',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Institucion&tabla=Institution')
        Funcion.create(:id_funcion => 'F75',:descripcion =>'Área de Interés',:id_padre => 'F70',:estatus => 1,:url => '/area_line')
        Funcion.create(:id_funcion => 'F76',:descripcion =>'Tipo de Materia',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Materia&tabla=Type_Subjects')
        Funcion.create(:id_funcion => 'F77',:descripcion =>'Régimen de Estudio',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Regimen+de+Estudio&tabla=RegimenStudy')
        Funcion.create(:id_funcion => 'F78',:descripcion =>'Modalidad de Programa',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Modalidad+de+Programa&tabla=Modality')
        Funcion.create(:id_funcion => 'F79',:descripcion =>'Tipo de Opinión',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Opinion&tabla=TypeOpinion')
        Funcion.create(:id_funcion => 'F80',:descripcion =>'Tipo de Revisión',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Revisión&tabla=TypeReview')
        Funcion.create(:id_funcion => 'F81',:descripcion =>'Tipo de Encuesta',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Encuesta&tabla=TypePoll')
        Funcion.create(:id_funcion => 'F82',:descripcion =>'Tipo de Solicitud',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Solicitud&tabla=TypeRequest')
        Funcion.create(:id_funcion => 'F83',:descripcion =>'Tipo de Motivo',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Motivo&tabla=TypeReason')
        Funcion.create(:id_funcion => 'F84',:descripcion =>'Grado Académico',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Grado+Academico&tabla=AcademicDegree')
        Funcion.create(:id_funcion => 'F85',:descripcion =>'Tipos de Notificaciones',:id_padre => 'F70',:estatus => 1,:url => '')
        Funcion.create(:id_funcion => 'F86',:descripcion =>'Tipo de Respuesta de Solicitud',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Respuesta+de+Solicitud&tabla=TypeReqResps')
        Funcion.create(:id_funcion => 'F87',:descripcion =>'Estado de Recursos',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Estado+de+Recursos&tabla=State')
        Funcion.create(:id_funcion => 'F88',:descripcion =>'Preguntas de Encuestas',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+de+Motivo&tabla=TypeReason')
        Funcion.create(:id_funcion => 'F89',:descripcion =>'Respuestas de Encuestas',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Respuestas+de+Encuestas&tabla=Answer')
        #Funcion.create(:id_funcion => 'F90',:descripcion =>'Días de la Semana',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Dias+de+la+Semana&tabla=DayWeek')
        #Funcion.create(:id_funcion => 'F91',:descripcion =>'Bloques de Horario',:id_padre => 'F70',:estatus => 1,:url => 'blocks')
        #Funcion.create(:id_funcion => 'F92',:descripcion =>'Tipo Slider',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+Slider&tabla=TypeSlider')
        Funcion.create(:id_funcion => 'F93',:descripcion =>'¿Cómo Se Enteró?',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Como+Se+Entero&tabla=FindOut')
        Funcion.create(:id_funcion => 'F94',:descripcion =>'¿Por Qué DCYT?',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Por+que+DCYT&tabla=WhyDcyt')
        Funcion.create(:id_funcion => 'F95',:descripcion =>'Tipo Contacto',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Tipo+Contacto&tabla=TypeContacts')
        Funcion.create(:id_funcion => 'F96',:descripcion =>'Contacto Sobre',:id_padre => 'F70',:estatus => 1,:url => '/maestricos/prueba?titulo=Contacto+Sobre&tabla=ContactAbouts')
    
    # Option Principal 9
    Funcion.create(:id_funcion => 'F97',:descripcion =>'Seguridad Funcional',:id_padre => nil,:estatus => 1,:url => '')
      # Options
      Funcion.create(:id_funcion => 'F98',:descripcion =>'Usuarios',:id_padre => 'F97',:estatus => 1,:url => '/users')
      Funcion.create(:id_funcion => 'F99',:descripcion =>'Roles del Sistema',:id_padre => 'F97',:estatus => 1,:url => '/maestricos/prueba?titulo=Roles+del+Sistema&tabla=Role')
      Funcion.create(:id_funcion => 'F100',:descripcion =>'Permisologia del Menú',:id_padre => 'F97',:estatus => 1,:url => '/role_funcions')

  end
end
