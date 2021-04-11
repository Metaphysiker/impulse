/// <reference types="cypress" />

context('Actions', () => {
  beforeEach(() => {
    //cy.visit('localhost:3000')
    var random_string = Date.now().toString()
    var email = random_string + "@gmail.com"
    var first_name = "John"
    var last_name = random_string
    var password = random_string
    cy.login(email, first_name, last_name, password)
  })

  // https://on.cypress.io/interacting-with-elements

  it('visits the front page', () => {
    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.get('body').contains('Tauschbörse')
  })
})
