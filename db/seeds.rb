# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Cargo algunos usuarios"

if User.where(email: 'barby@live.com.ar').empty?

   u1=User.create(email: 'barby@live.com.ar',name: 'Barbara', apellido: 'Acosta', telefono: '4527175', dni: '37363795',localidad: 'La Plata', password: 'contraseña' , password_confirmation: 'contraseña', admin: 'true')

end

if User.where(email: 'otro@live.com.ar').empty?

   u2=User.create(email: 'otro@live.com.ar', name: 'Otra', apellido: 'Persona',telefono: '1234567', dni: '12365678', localidad: 'La Plata', password: 'contraseña',  password_confirmation: 'contraseña', admin: 'false')

end

if User.where(email: 'gina@live.com.ar').empty?

   u3=User.create(email: 'gina@live.com.ar', name: 'Gina', apellido: 'Galvez Huerta',telefono: '4418635', dni: '34569874', localidad: 'La Plata',password: 'contraseña',  password_confirmation: 'contraseña', admin: 'true')

end