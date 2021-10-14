describe('CvGenerator User', () => {

  beforeEach(function () {

    cy.request('http://localhost:3000/test_data/generate_fake_users_and_json')
    cy.request('http://localhost:3000/test_data/cv_units')
    cy.request('http://localhost:3000/test_data/users')
    cy.request('http://localhost:3000/test_data/cvs')

    cy.visit('http://localhost:3000')

    cy.fixture('first_batch_of_users.json').then((users) => {
      cy.signup(users[0]);
    });

  })

  afterEach(function(){
    cy.destroy_user_account();
  })


  it('tries to generate cvs', () => {
    cy.visit('http://localhost:3000')
    cy.get('[data-cy=i_am_mentee]').click()
    cy.get('[data-cy=i_want_to_create_a_cv]').click()
    cy.get('[data-cy=update_user_for_cv_form]').within(($form) => {

      cy.fixture('first_batch_of_users.json').then((users) => {

        var user = users[0];
        //cy.get('#user_email').type(user.email)
        //cy.get('#user_email').type(unique_email)
        //cy.get('#user_password').type("password")
        cy.get('#user_first_name').type(user.first_name)
        cy.get('#user_last_name').type(user.last_name)
        cy.get('#user_location').type(user.location)
        cy.get('#user_plz').type(user.plz)
        cy.get('#user_street').type(user.street)
        cy.get('#user_phone').type(user.phone)
        cy.get('#user_birth_day_3i').select(Number(user.birth_day.split("-")[2]).toString());
        cy.get('#user_birth_day_2i').select(Number(user.birth_day.split("-")[1]).toString())
        cy.get('#user_birth_day_1i').select(Number(user.birth_day.split("-")[0]).toString())
        cy.get('#user_job_title').type(user.job_title)
        cy.get('#user_website').type(user.website)
        cy.get('#user_short_description').type(user.short_description)
        cy.get('#user_long_description').type(user.long_description)
        cy.get('#user_power_word1').type(user.power_word1)
        cy.get('#user_power_word2').type(user.power_word2)
        cy.get('#user_power_word3').type(user.power_word3)
        cy.get('#user_quote').type(user.quote)
        cy.get('#user_nationality').type(user.nationality)
        cy.get('#user_marital_status').type(user.marital_status)
      });

      cy.root().submit()
    })

    cy.fill_in_cv_unit("experience");
    cy.fill_in_cv_unit("education");
    cy.fill_in_skills_cv_unit("skills");
    cy.get('[data-cy=cv_generator_loading_screen_button]').first().click();
    cy.request('http://localhost:3000/cv_generator/available_templates').then((templates) => {
      console.log(templates.body);
      for (var index = 0; index < templates.body.length; index++) {
        console.log(index);
        cy.contains("Erstellt: " + index);
      }
    })

    //cy.downloadFile('https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg','mydownloads','example.jpg')

    cy.contains("Lebenslauf auswählen");
    cy.fixture('first_batch_of_users.json').then((users) => {
      var user = users[0];
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    cy.fixture('cv_unit_education_edited.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    cy.fixture('cv_unit_experience_edited.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    cy.fixture('cv_unit_skills_edited.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });
  })
})
