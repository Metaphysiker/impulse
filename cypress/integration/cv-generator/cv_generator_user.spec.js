describe('CvGenerator User', () => {

  before(function () {
    cy.request('http://localhost:3000/test_data/generate_json_of_translation')
  })

  beforeEach(function () {

    cy.request('http://localhost:3000/test_data/generate_first_batch_of_users')
    cy.request('http://localhost:3000/test_data/generate_second_batch_of_users')
    cy.request('http://localhost:3000/test_data/destroy_all_cv_units')
    cy.request('http://localhost:3000/test_data/destroy_all_users')
    cy.request('http://localhost:3000/test_data/destroy_all_cvs')

    cy.visit('http://localhost:3000')

    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      cy.signup(users[0]);
    });

  })

  afterEach(function(){
    cy.destroy_user_account();
  })

  it('tries to generate cvs', () => {
    //cy.visit('http://localhost:3000')
    //cy.get('[data-cy=i_am_mentee]').click()
    //cy.get('[data-cy=i_want_to_create_a_cv]').click()
    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      cy.create_cvs(users[0])
    });

  })


})
