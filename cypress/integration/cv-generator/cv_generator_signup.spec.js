describe('CvGenerator Signup', () => {

  before(function () {
    cy.request('http://localhost:3000/test_data/generate_json_of_translation')
  })

  beforeEach(function () {
    cy.request('http://localhost:3000/test_data/generate_first_batch_of_users')
    cy.request('http://localhost:3000/test_data/generate_second_batch_of_users')
    cy.request('http://localhost:3000/test_data/destroy_all_cv_units')
    cy.request('http://localhost:3000/test_data/destroy_all_users')
    cy.request('http://localhost:3000/test_data/destroy_all_cvs')
  })

  afterEach(function(){
    //cy.destroy_user_account();
  })

  it('expects error message when email is empty or if email already exists', () => {

    cy.visit('http://localhost:3000/users/sign_up')
    cy.get("[data-cy=form_for_registration]").within(($form) => {
      cy.root().submit()
    })
    cy.contains('e-Mail muss ausgefüllt werden')
    cy.contains('Passwort muss ausgefüllt werden')

    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      cy.signup(users[0]);
      cy.logout();

      cy.visit('http://localhost:3000/users/sign_up')

      cy.get("[data-cy=form_for_registration]").within(($form) => {
        cy.get('#user_email').type(users[0]["email"])
        cy.get('#user_password').type("password")
        cy.get('#user_password_confirmation').type("password")
        cy.root().submit()
      })

      cy.contains('e-Mail ist bereits vergeben')

    });


  })

  it('expects mentoring-check at signup', () => {

    cy.visit('http://localhost:3000/users/sign_up')
    cy.fixture('locales/de.json').should((de) => {
      cy.contains(de["de"]["are_you_in_mentoring50"]);
    });

  })


})
