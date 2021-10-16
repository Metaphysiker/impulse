describe('CvGenerator Basics', () => {

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
    cy.destroy_user_account();
  })

  it('expects message if there are no cvs', () => {

    cy.visit('http://localhost:3000')
    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      cy.signup(users[0]);
    });

    cy.get('[data-cy=view_my_cvs]').first().click();
    
    cy.fixture('locales/de.json').should((de) => {
      expect(de["de"]["no_cvs_created"]).to.exist
      expect(de["de"]["please_create_cvs"]).to.exist
    })


  })


})
