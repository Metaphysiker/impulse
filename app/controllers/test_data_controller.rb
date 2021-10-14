class TestDataController < ApplicationController

  if Rails.env.development?
    def cv_units
      CvUnit.all.destroy_all
    end

    def users
      User.all.destroy_all
    end

    def cvs
      Cv.all.destroy_all
    end

    def generate_fake_users_and_json
      20.times do

        user = User.new(email: Faker::Internet.email, password: "password",
          password_confirmation: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
          location: "Basel", plz: "8400", street: "Hauptstrasse 4", birth_day: Date.today - 50.years,
          phone: "1234567890", recruitment_consultant: "Paul Müller",
          disposal_period_start: Date.today, disposal_period_end: Date.today + 3.months,
          personal_number: "4626262555", unemployment_insurance_number: "12",
          job_title: "Ausbildungsberaterin", website: "www.my-website.com",
          nationality: "Schweiz",
          birth_day: Faker::Date.birthday(min_age: 18, max_age: 80),
          marital_status: "ledig",
          short_description: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4),
          long_description: Faker::Lorem.sentence(word_count: 5, supplemental: false, random_words_to_add: 4),
          power_word1: "Flexibel",
          power_word2: "Belastbar",
          power_word3: "Kreativ",
          quote: "Wege entstehen dadurch, dass wir sie gehen"
          )

        user.cover.attach(io: File.open('cypress/fixtures/images/stalin_portrait.jpg'), filename: 'stalin_portrait.jpg')
        user.save
      end

      #File.write("cypress/fixtures/first_batch_of_users.csv", User.to_csv)
      File.write("cypress/fixtures/first_batch_of_users.json", User.all.to_json(:only => User.showable_attribute_names_for_test))
      head :ok
    end
  end
end
