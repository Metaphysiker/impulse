describe('CvGenerator User', () => {

  before(function () {
    cy.request('http://localhost:3000/test_data/generate_json_of_translation')
  })

  beforeEach(function () {

    cy.request('http://localhost:3000/test_data/generate_fake_users_and_json')
    cy.request('http://localhost:3000/test_data/cv_units')
    cy.request('http://localhost:3000/test_data/users')
    cy.request('http://localhost:3000/test_data/cvs')

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




  })
})
