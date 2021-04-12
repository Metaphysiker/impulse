/// <reference types="cypress" />
//const requiredExample = require('../../fixtures/user')
//import user from '/cypress/fixtures/user.json'
const some_name = "Tauschbörse"

context('Login', () => {
  beforeEach(() => {

    let wags = "Portsmouth";
    cy.wrap(wags).as('wags')
    cy.get('@wags').then(wags => {
    expect(wags).to.contain("Portsmouth")
    })

    var user = {email: Date.now().toString() + "@gmail.com", first_name: "Jonas", last_name: "Müller"};
    cy.wrap(user).as('user')
    cy.get('@user').then(user => {
      expect(user["first_name"]).to.contain("Jonas")
    })


    let email = Date.now().toString() + "@gmail.com"
    let first_name = "Manfred"
    let last_name = "Müller"

    // other test code here
    cy.login(user["email"], user["first_name"], user["last_name"], "password")
  })

  // https://on.cypress.io/interacting-with-elements

  it('visits the front page', () => {

    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.get('body').contains('Tauschbörse')

    cy.get('@user').then(user => {
      expect(user["first_name"]).to.contain("Jonas")
    })
  })

  it('visits mein Impulse', () => {
    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.contains('Mein Impulse').click()
    cy.get('body').contains('Mein Impulse')
    cy.get('@user').then(user => {
      cy.get('body').contains(user["first_name"])
      cy.get('body').contains(user["last_name"])
      cy.get('body').contains(user["email"])
    })
    //cy.get('body').contains(first_name)
  })

})
