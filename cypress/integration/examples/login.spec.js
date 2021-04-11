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

    var myObj = {name: "John", age: 31, city: "New York"};
    cy.wrap(myObj).as('myObj')
    cy.get('@myObj').then(myObj => {
    expect(myObj["name"]).to.contain("John")
    })


    let email = Date.now().toString() + "@gmail.com"
    let first_name = "Manfred"
    let last_name = "Müller"

    // other test code here
    cy.login(email, first_name, last_name, "password")
  })

  // https://on.cypress.io/interacting-with-elements

  it('visits the front page', () => {
    cy.log(some_name)
    cy.get('@wags').then(wags => {
    expect(wags).to.contain("Portsmouth")
    })

    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.get('body').contains('Tauschbörse')
    cy.get('body').contains(some_name)
  })

  it('visits mein Impulse', () => {
    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.contains('Mein Impulse').click()
    cy.get('body').contains('Mein Impulse')
    //cy.get('body').contains(first_name)
  })

})
