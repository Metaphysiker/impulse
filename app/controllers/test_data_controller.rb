class TestDataController < ApplicationController
  if Rails.env.development?


    def destroy_all_cv_units
      CvUnit.all.destroy_all
    end

    def destroy_all_users
      User.all.each do |user|
        sign_out user
      end

      User.all.destroy_all
    end

    def destroy_all_cvs
      Cv.all.destroy_all
    end

    def generate_first_batch_of_users
      20.times do
        create_fake_user()
      end

      #File.write("cypress/fixtures/first_batch_of_users.csv", User.to_csv)
      File.write("cypress/fixtures/first_batch_of_users.json", User.all.to_json(:only => User.showable_attribute_names_for_test))
      head :ok
    end

    def generate_second_batch_of_users
      20.times do
        create_fake_user()
      end

      #File.write("cypress/fixtures/first_batch_of_users.csv", User.to_csv)
      File.write("cypress/fixtures/second_batch_of_users.json", User.all.to_json(:only => User.showable_attribute_names_for_test))
      head :ok
    end

    def generate_fake_admins_and_json
      3.times do
        create_fake_admin()
      end

      admins = User.joins(:roles).where(:roles => {:name => "admin"})
      #File.write("cypress/fixtures/first_batch_of_users.csv", User.to_csv)
      File.write("cypress/fixtures/first_batch_of_admins.json", admins.to_json(:only => User.showable_attribute_names_for_test))
      head :ok
    end

    def generate_json_of_translation
      locale = YAML.load_file('config/locales/de.yml')
      File.write("cypress/fixtures/locales/de.json", locale.to_json)
      head :ok
    end


    private

    def create_fake_user
      user = User.new(email: Faker::Internet.email, password: "password",
        password_confirmation: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
        location: Faker::Address.city, plz: Faker::Address.zip_code, street: Faker::Address.street_address, birth_day: Date.today - 50.years,
        phone: "1234567890", recruitment_consultant: "Paul Müller",
        disposal_period_start: Date.today, disposal_period_end: Date.today + 3.months,
        personal_number: "4626262555", unemployment_insurance_number: "12",
        job_title: Faker::Job.title, website: "www.my-website.com",
        nationality: "Schweiz",
        birth_day: Faker::Date.birthday(min_age: 18, max_age: 80),
        marital_status: "ledig",
        short_description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
        long_description: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 4),
        power_word1: "Flexibel",
        power_word2: "Belastbar",
        power_word3: "Kreativ",
        quote: "Wege entstehen dadurch, dass wir sie gehen",
        are_you_in_mentoring50: ["yes", "no"].sample,
        motivation_letter_why_you: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 4),
        motivation_letter_why_me: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 4),
        motivation_letter_why_us: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 4)
        )

      user.cover.attach(io: File.open('cypress/fixtures/images/stalin_portrait.jpg'), filename: 'stalin_portrait.jpg')
      user.save
    end

    def create_fake_admin
      user = User.new(email: Faker::Internet.email, password: "password",
        password_confirmation: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
        location: Faker::Address.city, plz: Faker::Address.zip_code, street: Faker::Address.street_address, birth_day: Date.today - 50.years,
        phone: "1234567890", recruitment_consultant: "Paul Müller",
        disposal_period_start: Date.today, disposal_period_end: Date.today + 3.months,
        personal_number: "4626262555", unemployment_insurance_number: "12",
        job_title: Faker::Job.title, website: "www.my-website.com",
        nationality: "Schweiz",
        birth_day: Faker::Date.birthday(min_age: 18, max_age: 80),
        marital_status: "ledig",
        short_description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
        long_description: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 4),
        power_word1: "Flexibel",
        power_word2: "Belastbar",
        power_word3: "Kreativ",
        quote: "Wege entstehen dadurch, dass wir sie gehen",
        are_you_in_mentoring50: ["yes", "no"].sample
        )

      user.cover.attach(io: File.open('cypress/fixtures/images/stalin_portrait.jpg'), filename: 'stalin_portrait.jpg')
      user.roles << Role.find_by_name("admin") unless user.roles.where(name: "admin").exists?

      user.save
    end


  end
end
