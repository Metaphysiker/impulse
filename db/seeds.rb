# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user.roles << Role.find_by_name("admin") unless user.roles.where(name: "admin").exists?
Role.roles.each do |role|
  Role.create(name: role)
end

Tag.tags.each do |tag|
  Tag.create(title: tag)
end

Expertise.expertises.each do |expertise|
  Expertise.create(title: expertise)
end

nicole = User.create(email: "nicole.bertherin@impulse.swiss", password: "abcdef", password_confirmation: "abcdef", first_name: "Nicole", last_name: "Bertherin")
nicole.roles << Role.find_by_name("admin") unless nicole.roles.where(name: "admin").exists?
nicole.roles << Role.find_by_name("mentor") unless nicole.roles.where(name: "mentor").exists?


admin = User.create(email: "admin@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Admin", last_name: "Admin")
admin.roles << Role.find_by_name("admin") unless admin.roles.where(name: "admin").exists?
admin.roles << Role.find_by_name("mentor") unless admin.roles.where(name: "mentor").exists?

mentor = User.create(email: "mentor@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Mentor", last_name: "Mentor")
mentor.roles << Role.find_by_name("mentor") unless mentor.roles.where(name: "mentor").exists?

regular = User.create(email: "regular@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Regular", last_name: "Regular")


testuser = User.create(email: "test@gmail.com", password: "abcdef",
  password_confirmation: "abcdef", first_name: "Isabella", last_name: "Merlin",
  location: "Basel", plz: "8400", street: "Hauptstrasse 4", birth_day: Date.today - 50.years,
  phone: "1234567890", recruitment_consultant: "Paul Müller",
  disposal_period_start: Date.today, disposal_period_end: Date.today + 3.months,
  personal_number: "4626262555", unemployment_insurance_number: "12",
  job_title: "Ausbildungsberaterin", website: "www.my-website.com",
  nationality: "Schweiz",
  marital_status: "ledig",
  short_description: "Ich bin ausgebildete Lehrerin und arbeite als Bildungsberaterin. Ich suche eine Stelle mit der Möglichkeit, Einfluss auf kleine und grössere Bildungssysteme zu nehmen.",
  long_description: "Selbstständig und lege Wert darauf, Termine einzuhalten. Richte mich nach festgelegten Strukturen und Verfahren und halte diese ein.\n\nLege Wert darauf, dass die Dinge durchdacht und in Ordnung sind und bin in der Lage, sie bis zu Ende durchzuführen.\n\nBekannt als hilfsbereiter und guter Kollege mit positiver Einstellung zu den Dingen und zum Alltag, auch wenn es hektisch wird.",
  power_word1: "Flexibel",
  power_word2: "Belastbar",
  power_word3: "Kreativ",
  quote: "Wege entstehen dadurch, dass wir sie gehen"
  )

#testuser = User.find_by_email("test@gmail.com")

testuser.cv_units << CvUnit.create(
  category: "experience", name: "Abteilungsleiterin",
  company: "Zentrum für Bildung", location: "Bern",
  content: "Leitung der verschiedenen Teams der Abteilung für Erwachsenenbildung\nBeurteilung und Einstellung von Personal\nGenehmigung von Budgets für spezielle Bildungsprojekte", start_date: Date.today - 1.year, end_date: Date.today)

testuser.cv_units << CvUnit.create(
  category: "experience", name: "Abteilungsspezialistin",
  company: "Forschungszentrum", location: "Biel",
  content: "Leitung von Workshops für Erwachsenenbildung und Lerntheorien\nErstellung und Einführung von neuen Lernstrategien für Erwachsene\nMentoring neuer Lehrpersonen", start_date: Date.today - 2.year, end_date: Date.today - 1.year)

testuser.cv_units << CvUnit.create(
  category: "education", name: "MSC in Psychologie",
  company: "Goethe-Universität", location: "Frankfurt",
  content: "Thema der Masterarbeit: Neue Ansätze für spezialisierte Erwachsenenbildung und -training\nVorstand im Debattierclub", start_date: Date.today - 3.year, end_date: Date.today - 2.year)

testuser.cv_units << CvUnit.create(
  category: "education", name: "BSC in Psychologie",
  company: "Fachhochschule Graubünden", location: "Chur",
  content: "Thema der Bachelorarbeit: Können Kinder besser lernen als Erwachsene?", start_date: Date.today - 5.year, end_date: Date.today - 4.year)

testuser.cv_units << CvUnit.create(
  category: "skills", name: "Sprachen",
  content: "Deutsch: Muttersprache\nFranzösisch: Schriftlich & Mündlich\nItalienisch: Grundkenntnisse")

testuser.cv_units << CvUnit.create(
  category: "skills", name: "EDV",
  content: "Word, Excel, Photoshop, Linux, Outlook")

testuser.cv_units << CvUnit.create(
  category: "skills", name: "Erziehung",
  content: "Analysen erstellen von Sozialisation, Erziehung und Bildung\nErstellen von Lernstrategien\nErkennen von Lernschwächen")
