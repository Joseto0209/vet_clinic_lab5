Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Dueños listo"
owner1 = Owner.create!(first_name: "Matías", last_name: "González", email: "matias.g@gmail.com", phone: "+56912345678", address: "Av. Bicentenario 3800, Vitacura")
owner2 = Owner.create!(first_name: "Isidora", last_name: "Undurraga", email: "isi.u@hotmail.com", phone: "+56987654321", address: "Av. San Martín 450, Viña del Mar")
owner3 = Owner.create!(first_name: "Diego", last_name: "Tapia", email: "diego.t@yahoo.cl", phone: "+56955555555", address: "Barrio República, Santiago")

puts "Registrando las mascotas"
pet1 = owner1.pets.create!(name: "Cachupín", species: "Perro", breed: "Quiltro", date_of_birth: Date.new(2019, 9, 18), weight: 15.5)
pet2 = owner1.pets.create!(name: "Pelusa", species: "Perro", breed: "Poodle Toy", date_of_birth: Date.new(2021, 4, 12), weight: 4.2)
pet3 = owner2.pets.create!(name: "Cucho", species: "Gato", breed: "Romano", date_of_birth: Date.new(2020, 8, 1), weight: 5.8)
pet4 = owner3.pets.create!(name: "Guatón", species: "Perro", breed: "Bulldog Inglés", date_of_birth: Date.new(2018, 12, 25), weight: 25.0)
pet5 = owner2.pets.create!(name: "Tambo", species: "Conejo", breed: "Angora", date_of_birth: Date.new(2022, 3, 15), weight: 2.1)

puts "Anotando veterinarios"
vet1 = Vet.create!(first_name: "Javiera", last_name: "Soto", email: "jsoto@veterinaria.cl", phone: "+56911112222", specialization: "Medicina General")
vet2 = Vet.create!(first_name: "Rodrigo", last_name: "Pérez", email: "rperez@veterinaria.cl", phone: "+56933334444", specialization: "Cirugía y Traumatología")

puts "Agendando horas en la clínica"
app1 = Appointment.create!(pet: pet1, vet: vet1, date: Time.current - 2.days, reason: "Se comió un choripán en el asado", status: 2) # Completed
app2 = Appointment.create!(pet: pet3, vet: vet2, date: Time.current - 1.day, reason: "Pelea en el techo con otros gatos", status: 2) # Completed
app3 = Appointment.create!(pet: pet4, vet: vet1, date: Time.current, reason: "Problemas respiratorios por la calor", status: 1) # In progress
app4 = Appointment.create!(pet: pet2, vet: vet1, date: Time.current + 3.days, reason: "Control sano y vacunas", status: 0) # Scheduled
app5 = Appointment.create!(pet: pet5, vet: vet2, date: Time.current - 5.days, reason: "Revisión de patitas", status: 3) # Cancelled

puts "Aplicando tratamientos médicos"
Treatment.create!(appointment: app1, name: "Lavado Gástrico", medication: "Carbón Activado", dosage: "20 ml", notes: "El perro está bien, pero sin más choripanes por un buen rato. Superó el empacho.", administered_at: Time.current - 2.days)
Treatment.create!(appointment: app1, name: "Hidratación", medication: "Suero fisiológico", dosage: "500 ml", notes: "Se le administró suero para estabilizarlo.", administered_at: Time.current - 2.days)
Treatment.create!(appointment: app2, name: "Sutura de oreja", medication: "Anestesia local y Povidona", dosage: "3 puntos", notes: "El Cucho perdió la pelea, pero la sutura quedó impecable.", administered_at: Time.current - 1.day)
Treatment.create!(appointment: app2, name: "Antibiótico", medication: "Amoxicilina", dosage: "1 pastilla cada 12h", notes: "Para evitar infección en los arañazos.", administered_at: Time.current - 1.day)
Treatment.create!(appointment: app3, name: "Oxigenoterapia", medication: "Oxígeno", dosage: "15 min", notes: "El Guatón ya respira mejor con el aire acondicionado de la clínica.", administered_at: Time.current)

puts "Ready la base de datos"