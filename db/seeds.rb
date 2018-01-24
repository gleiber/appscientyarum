
ActiveRecord::Base.connection.execute("TRUNCATE role_funcions RESTART IDENTITY CASCADE")

funciones = Funcion.all
role_funcions = Array.new

funciones.each do |f|
  role_funcions.push({role_id: "1", funcion_id: f.id})
end

role_funcions.each do |rf|
  RoleFuncion.create!(rf)
end
