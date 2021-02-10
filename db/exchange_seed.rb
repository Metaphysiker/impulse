user1 = User.create(email: "jonas.kurz@me.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Jonas", last_name: "Kurz")
user1.skills << Skill.create(title: "Webseiten gestalten", category: "offered")
user1.skills << Skill.create(title: "Steuererklärung ausfüllen", category: "offered")
user1.skills << Skill.create(title: "Lebenslauf verbessern", category: "needed")
user1.skills << Skill.create(title: "Training für Bewerbungsgespräch", category: "needed")
user1.cover.attach(io: File.open("#{Rails.root}/app/assets/images/portrait_mann.png"), filename: 'picture.png', content_type: 'image/png')

user2 = User.create(email: "lara.meier@me.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Lara", last_name: "Meier")
user2.skills << Skill.create(title: "Buchhaltung führen", category: "offered")
user2.skills << Skill.create(title: "Business-Management", category: "offered")
user2.skills << Skill.create(title: "Hilfe bei Rechtschreibung", category: "needed")
user2.skills << Skill.create(title: "Arbeitsrecht erklären", category: "needed")
user2.cover.attach(io: File.open("#{Rails.root}/app/assets/images/portrait_frau.png"), filename: 'picture.png', content_type: 'image/png')

user3 = User.create(email: "sandro.raess@impulse.swiss", password: "abcdef", password_confirmation: "abcdef", first_name: "Sandro", last_name: "Räss")
user3.skills << Skill.create(title: "Ethik-Unterricht", category: "offered")
user3.skills << Skill.create(title: "Webseiten programmieren", category: "offered")
user3.skills << Skill.create(title: "Rechts-Grundlagen erklären", category: "needed")
user3.skills << Skill.create(title: "Buchhaltung einführen", category: "needed")
user3.cover.attach(io: File.open("#{Rails.root}/app/assets/images/Raess-Sandro.jpg"), filename: 'picture.jpg', content_type: 'image/jpg')

user4 = User.create(email: "nicole.bertherin@impulse.swiss", password: "abcdef", password_confirmation: "abcdef", first_name: "Nicole", last_name: "Bertherin")
user4.skills << Skill.create(title: "Coaching", category: "offered")
user4.skills << Skill.create(title: "Lebenslauf-Gestaltung", category: "offered")
user4.cover.attach(io: File.open("#{Rails.root}/app/assets/images/nicole-bertherin.jpg"), filename: 'picture.jpg', content_type: 'image/jpg')