# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Cargo algunos favores"
Favor.where(titulo:'Busco acompañante de viaje', descripcion: "Soy camionero y busco una persona que me acompañe en mi viaje hasta Rawson porque sufro problemas de sueño. 
Saldríamos el primer fin de semana de octubre y retornaríamos el fin de semana siguiente. 
* Condición fundamental: debe cebar buenos mates", localidad:"La Plata").first_or_create

Favor.where(titulo: 'Reencontrarme con Ramirez', descripcion: "Ramirez es un burrito que tenía de mascota en un campo en Tucumán. Quisiera reencontrarme con él pero no puedo moverme por un problema físico. 
Me gustaría que alguien lo traiga desde mi pueblo para poder saludarlo y luego volver a llevarlo.
*la foto es del 2004, Ramirez puede haber cambiado un poco", localidad:"La Plata", imagen: "http://fotos.subefotos.com/cc062de7aacf320178fd84d423da8ec1o.jpg").first_or_create

Favor.where(titulo: 'Busco testigo falso', descripcion: "El año pasado tuve un accidente automovilístico en el que choqué el frente de una casa. El dueño de esa casa me quiere llevar a juicio y estoy buscando evitarlo.
Necesito de un/a abuelito/a que testifique a mi favor diciendo que choqué el frente de la casa por esquivarlo/a.", localidad:"La Plata").first_or_create

Favor.where(titulo: 'Karl', descripcion: "Karl es mi perrito y necesita de alguien que lo cuide durante la primera quincena de enero que me voy de vacaciones.
Es muy juguetón y muy buena compañía.", localidad:"La Plata", imagen: "http://fotos.subefotos.com/a38ac6029b9e59fb1136d8e3a2ec4baco.jpg").first_or_create

Favor.where(titulo: 'Restaurar obra de arte', descripcion: "La imagen de la izquierda es la original y la de la derecha mi intento por restaurarla. ¿Alguien me haría la gauchada de acomodarla para que se parezca más a la original? ", localidad:"La Plata", imagen: "http://fotos.subefotos.com/c8ec5edfb098fed2c5278b8ae0d26bc3o.jpg").first_or_create


puts "Cargo algunos usuarios"
if User.where(email: 'barby@live.com.ar').empty?
    u1=User.create(email: 'barby@live.com.ar',name:'Barbara', apellido: 'Acosta', telefono: '4527175', dni: '37363795',localidad: 'La Plata', password: 'contraseña' , password_confirmation: 'contraseña', admin: 'false',logro_id:101)
end
if User.where(email: 'maximiliano.apodaca@gmail.com.ar').empty?
    u2=User.create(email: 'maximiliano.apodaca@gmail.com.ar', name: 'Maximiliano', apellido: 'Apodaca',telefono: '4255588', dni: '37370098', localidad: 'La Plata', password: 'contraseña',  password_confirmation: 'contraseña', admin: 'false',logro_id:107)
end
if User.where(email: 'gina@live.com.ar').empty?
    u3=User.create(email: 'gina@live.com.ar', name: 'Gina', apellido: 'Galvez Huerta',telefono: '4418635', dni: '34569874', localidad: 'La Plata',password: 'contraseña',  password_confirmation: 'contraseña', admin: 'false',logro_id:100)
end
if User.where(email: 'maximiliano.apodaca@gmail.com').empty?
    u4=User.create(email: 'maximiliano.apodaca@gmail.com', name: 'Maximiliano', apellido: 'Apodaca',telefono: '4255588', dni: '3737098', localidad: 'La Plata',password: 'ddi283',  password_confirmation: 'ddi283', admin: 'false', logro_id:107)
end
if User.where(email: 'ulises.sunetri@gmail.com').empty?
	u5=User.create(email: 'ulises.sunetri@gmail.com', name: 'Ulises', apellido: 'Sunetri',telefono: '42530564', dni: '14187518', localidad: 'La Plata',password: 'contraseña',  password_confirmation: 'contraseña', admin: 'true', logro_id:101)
end
if User.where(email: 'nancy@gmail.com').empty?
	u6=User.create(email: 'nancy@gmail.com', name: 'Nancy', apellido: 'Diaz',telefono: '425110564', dni: '26278818', localidad: 'La Plata',password: 'contraseña',  password_confirmation: 'contraseña', admin: 'true', logro_id:101)
end


