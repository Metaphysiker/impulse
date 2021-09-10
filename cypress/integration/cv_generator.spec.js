// cv_generator.spec.js created with Cypress
//
// Start writing your Cypress tests below!
// If you're unfamiliar with how Cypress works,
// check out the link below and learn how to write your first test:
// https://on.cypress.io/writing-first-test
describe('CV Generator', () => {

  beforeEach(function () {
    // "this" points at the test context object
    //cy.fixture('user').as('user')
  })

  afterEach(function(){
    cy.destroy_user_account()
  })

  it('creates user, enters data, generates data and expects cvs', () => {
    cy.visit('http://localhost:3000')
    cy.get('[data-cy=i_am_mentee]').click()
    cy.get('[data-cy=i_want_to_create_a_cv]').click()
    cy.get('[data-cy=update_user_for_cv_form]').within(($form) => {
      // you have access to the found form via
      // the jQuery object $form if you need it

      // cy.get() will only search for elements within form,
      // not within the entire document
      cy.fixture('user.json').then((user) => {
  // "this" is still the test context object
        cy.get('#user_email').type(user.email)
        cy.get('#user_password').type(user.password)
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


      })

      cy.root().submit()
    })

    //update_cv_units_for_user_path
    //cy-new-entry-in-<%= category%>
    cy.get('[data-cy=new-entry-in-experience]').click()

    cy.get('[data-cy=form_for_cv_unit_category_experience]').within(($form) => {
      // you have access to the found form via
      // the jQuery object $form if you need it

      // cy.get() will only search for elements within form,
      // not within the entire document
      cy.fixture('cv_unit.json').then((cv_unit) => {
        cy.get('#cv_unit_name').type(cv_unit.name)
        cy.get('#cv_unit_company').type(cv_unit.company)
        cy.get('#cv_unit_location').type(cv_unit.location)
        cy.get('#cv_unit_start_date_2i').select(cv_unit.start_date_2i)
        cy.get('#cv_unit_start_date_1i').select(cv_unit.start_date_1i)
        cy.get('#cv_unit_end_date_2i').select(cv_unit.end_date_2i)
        cy.get('#cv_unit_end_date_1i').select(cv_unit.end_date_1i)
      })

      cy.root().submit()
    })

  })



})
