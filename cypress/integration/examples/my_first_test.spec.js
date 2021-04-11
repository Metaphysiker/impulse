/// <reference types="cypress" />

context('Actions', () => {
  beforeEach(() => {
    var random_user

    let url = 'https://randomuser.me/api/';

    //cy.visit('localhost:3000')
    var random_string = Date.now().toString()
    var email = random_string + "@gmail.com"
    var first_name = "John" //random_user["name"]["first"]
    var last_name = "Dellwig" //random_user["name"]["last"]
    var password = "password"
    cy.login(email, first_name, last_name, password)
  })

  // https://on.cypress.io/interacting-with-elements

  it('visits the front page', () => {
    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.get('body').contains('Tauschbörse')
  })
})
