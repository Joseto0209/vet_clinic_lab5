Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Creating owners..."
owner1 = Owner.create!(first_name: "Matías", last_name: "González", email: "matias.g@gmail.com", phone: "+56912345678", address: "Av. Bicentenario 3800, Vitacura")
owner2 = Owner.create!(first_name: "Isidora", last_name: "Undurraga", email: "isi.u@hotmail.com", phone: "+56987654321", address: "Av. San Martín 450, Viña del Mar")
owner3 = Owner.create!(first_name: "Diego", last_name: "Tapia", email: "diego.t@yahoo.cl", phone: "+56955555555", address: "Barrio República, Santiago")

puts "Registering pets..."
pet1 = owner1.pets.create!(name: "Cachupín", species: "dog", breed: "Mixed Breed", date_of_birth: Date.new(2019, 9, 18), weight: 15.5)
pet2 = owner1.pets.create!(name: "Pelusa", species: "dog", breed: "Toy Poodle", date_of_birth: Date.new(2021, 4, 12), weight: 4.2)
pet3 = owner2.pets.create!(name: "Cucho", species: "cat", breed: "Domestic Shorthair", date_of_birth: Date.new(2020, 8, 1), weight: 5.8)
pet4 = owner3.pets.create!(name: "Guatón", species: "dog", breed: "English Bulldog", date_of_birth: Date.new(2018, 12, 25), weight: 25.0)
pet5 = owner2.pets.create!(name: "Tambo", species: "rabbit", breed: "Angora", date_of_birth: Date.new(2022, 3, 15), weight: 2.1)

puts "Creating veterinarians..."
vet1 = Vet.create!(first_name: "Javiera", last_name: "Soto", email: "jsoto@veterinaria.cl", phone: "+56911112222", specialization: "General Medicine")
vet2 = Vet.create!(first_name: "Rodrigo", last_name: "Pérez", email: "rperez@veterinaria.cl", phone: "+56933334444", specialization: "Surgery and Traumatology")

puts "Scheduling appointments..."
app1 = Appointment.create!(pet: pet1, vet: vet1, date: Time.current - 2.days, reason: "Ate a sausage at the barbecue", status: :completed)
app2 = Appointment.create!(pet: pet3, vet: vet2, date: Time.current - 1.day, reason: "Fight on the roof with other cats", status: :completed)
app3 = Appointment.create!(pet: pet4, vet: vet1, date: Time.current, reason: "Breathing problems due to heat", status: :in_progress)
app4 = Appointment.create!(pet: pet2, vet: vet1, date: Time.current + 3.days, reason: "Routine checkup and vaccinations", status: :scheduled)
app5 = Appointment.create!(pet: pet5, vet: vet2, date: Time.current - 5.days, reason: "Paw examination", status: :cancelled)

puts "Applying medical treatments..."
Treatment.create!(appointment: app1, name: "Gastric Lavage", medication: "Activated Charcoal", dosage: "20 ml", notes: "The dog is fine, but no more sausages for a while. Recovered from indigestion.", administered_at: Time.current - 2.days)
Treatment.create!(appointment: app1, name: "Hydration", medication: "Saline Solution", dosage: "500 ml", notes: "Administered IV fluids for stabilization.", administered_at: Time.current - 2.days)
Treatment.create!(appointment: app2, name: "Ear Suture", medication: "Local Anesthesia and Povidone", dosage: "3 stitches", notes: "Cucho lost the fight, but the suture turned out great.", administered_at: Time.current - 1.day)
Treatment.create!(appointment: app2, name: "Antibiotic", medication: "Amoxicillin", dosage: "1 pill every 12h", notes: "To prevent infection from scratches.", administered_at: Time.current - 1.day)
Treatment.create!(appointment: app3, name: "Oxygen Therapy", medication: "Oxygen", dosage: "15 min", notes: "Guatón is already breathing better with the clinic's AC.", administered_at: Time.current)

puts "Database seeded successfully!"