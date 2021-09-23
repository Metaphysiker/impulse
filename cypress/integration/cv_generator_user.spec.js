describe('CvGenerator User', () => {

  beforeEach(function () {

    cy.fixture('user.json').then((user) => {
      const uuid = () => Cypress._.random(0, 1e6)
      const id = uuid()
      const unique_email = `${user.email}${id}`
      cy.signup(unique_email);
      cy.wrap(unique_email).as('unique_email')
    });

  })

  afterEach(function(){
    cy.destroy_user_account()
  })


  it('tries to generate cvs', () => {
    cy.visit('http://localhost:3000')
    cy.get('[data-cy=i_am_mentee]').click()
    cy.get('[data-cy=i_want_to_create_a_cv]').click()
    cy.get('[data-cy=update_user_for_cv_form]').within(($form) => {

      cy.fixture('user.json').then((user) => {
        //cy.get('#user_email').type(user.email)
        //cy.get('#user_email').type(unique_email)
        //cy.get('#user_password').type("password")
        cy.get('#user_first_name').type(user.first_name)
        cy.get('#user_last_name').type(user.last_name)
        cy.get('#user_location').type(user.location)
        cy.get('#user_plz').type(user.plz)
        cy.get('#user_street').type(user.street)
        cy.get('#user_phone').type(user.phone)
        cy.get('#user_birth_day_3i').select(user.birth_day_3i)
        cy.get('#user_birth_day_2i').select(user.birth_day_2i)
        cy.get('#user_birth_day_1i').select(user.birth_day_1i)
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

    //cy-new-entry-in-<%= category%>
    cy.get('[data-cy=new-entry-in-skills]').click()
    cy.get('[data-cy=form_for_cv_unit_category_skills]').within(($form) => {
      cy.fixture('cv_unit_skills.json').then((cv_unit) => {
        cy.get('#cv_unit_name').type(cv_unit.name)
        cy.get('#cv_unit_content').type(cv_unit.content)
      })
      cy.root().submit()
    })

    //cy.contains("cv_generator_loading_screen_button").first().click();
    cy.get('[data-cy=cv_generator_loading_screen_button]').first().click();

    //cy.request('http://localhost:3000/cv_generator/available_templates')as.('available_templates');

    cy.request('http://localhost:3000/cv_generator/available_templates').then((templates) => {
      console.log(templates.body);
      for (var index = 0; index < templates.body.length; index++) {
        console.log(index);
        cy.contains("Erstellt: " + index);
      }

    })


    //cy.waitUntil(() => cy.contains("Lebenslauf auswählen"));
    cy.contains("Lebenslauf auswählen");

    cy.fixture('user.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    cy.fixture('cv_unit_education.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    cy.fixture('cv_unit_experience.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    cy.fixture('cv_unit_skills.json').then((user) => {
      for (var attribute in user) {
        cy.contains(user[attribute])
      }
    });

    //cy.get('[data-cy=cv_generator_loading_screen_button]').first().click();
  //  var genArr = Array.from({length:250},(v,k)=>k+1)
  //  cy.wrap(genArr).each((index) => {
  //      cy.get("#button-" + index).click()
  //   })

  })



})
