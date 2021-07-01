#testuser = User.create(email: "test@gmail.com", password: "abcdef",
#  password_confirmation: "abcdef", first_name: "Karla", last_name: "Dellwig",
#  location: "Basel", plz: "8400", street: "Hauptstrasse 4", birth_day: Date.today - 50.years,
#  phone: "1234567890", recruitment_consultant: "Paul Müller",
#  disposal_period_start: Date.today, disposal_period_end: Date.today + 3.months,
#  personal_number: "4626262555", unemployment_insurance_number: "12",
#  job_title: "Ausbildungsberaterin", website: "www.my-website.com",
#  short_description: "Ich bin ausgebildete Lehrerin und arbeite als Bildungsberaterin. Ich suche eine Stelle mit der Möglichkeit, Einfluss auf kleine und grössere Bildungssysteme zu nehmen.")

testuser = User.find_by_email("test@gmail.com")

testuser.cv_units << CvUnit.create(
  category: "experience", name: "Abteilungsleiterin - Zentrum für Bildung",
  content: "Leitung der verschiedenen Teams der Abteilung für Erwachsenenbildung \nBeurteilung und Einstellung von Personal \nGenehmigung von Budgets für spezielle Bildungsprojekte", start_date: Date.today - 1.year, end_date: Date.today)

testuser.cv_units << CvUnit.create(
  category: "experience", name: "Abteilungsspezialistin - Forschungszentrum Biel",
  content: "Leitung von Workshops für Erwachsenenbildung und Lerntheorien \nErstellung und Einführung von neuen Lernstrategien für Erwachsene \nMentoring neuer Lehrpersonen", start_date: Date.today - 2.year, end_date: Date.today - 1.year)

testuser.cv_units << CvUnit.create(
  category: "education", name: "MSC in Psychologie - Universität Frankfurt",
  content: "Thema der Masterarbeit: Neue Ansätze für spezialisierte Erwachsenenbildung und -training\nVorstand im Debattierclub", start_date: Date.today - 3.year, end_date: Date.today - 2.year)

testuser.cv_units << CvUnit.create(
  category: "education", name: "BSC in Psychologie - Universität Groningen",
  content: "Thema der Bachelorarbeit: Können Kinder besser lernen als Erwachsene?", start_date: Date.today - 5.year, end_date: Date.today - 4.year)

testuser.cv_units << CvUnit.create(
  category: "skills", name: "Sprachen",
  content: "Deutsch, Französisch, Englisch, Russisch")

testuser.cv_units << CvUnit.create(
  category: "skills", name: "EDV",
  content: "Word, Excel, Photoshop, Linux, Outlook")

testuser.cv_units << CvUnit.create(
  category: "skills", name: "Erziehungswissen",
  content: "Analysen erstellen von Sozialisation, Erziehung und Bildung, Erstellen von Lernstrategien, Erkennen von Lernschwächen")
