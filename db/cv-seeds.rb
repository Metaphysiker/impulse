testuser = User.create(email: "test@gmail.com", password: "abcdef",
  password_confirmation: "abcdef", first_name: "Jonas", last_name: "Kurz",
  location: "Basel", plz: "8400", street: "Hauptstrasse 4", birth_day: Date.today - 50.years,
  phone: "1234567890", recruitment_consultant: "Paul Müller",
  disposal_period_start: Date.today, disposal_period_end: Date.today + 3.months,
  personal_number: "4626262555", unemployment_insurance_number: "12",
  job_title: "Designer", website: "www.my-website.com",
  short_description: "Ich designe...")

#experience
testuser.cv_units << CvUnit.create(
  category: "experience", name: "SENIOR DESIGNER: Creative Bee (Orlando, FL)",
  content: "", start_date: Date.today - 1.year, end_date: Date.today)

#education
testuser.cv_units << CvUnit.create(
  category: "education", name: "SENIOR DESIGNER: Creative Bee (Orlando, FL)",
  content: "", start_date: Date.today - 1.year, end_date: Date.today)

#skills
testuser.cv_units << CvUnit.create(
  category: "skills", name: "Sprachen",
  content: "Deutsch, Französisch, Englisch, Russisch",
  start_date: Date.today - 1.year, end_date: Date.today)

testuser.cv_units << CvUnit.create(
  category: "skills", name: "EDV",
  content: "Word, Excel, Photoshop, Linux, Outlook",
  start_date: Date.today - 1.year, end_date: Date.today)

testuser.cv_units << CvUnit.create(
  category: "skills", name: "Design",
  content: "Skizzen, Blaupausen, Webseiten designen",
  start_date: Date.today - 1.year, end_date: Date.today)

  #testuser.skills << Skill.create(title: "Webseiten gestalten", category: "offered")
