/// <reference types="cypress" />
//const requiredExample = require('../../fixtures/user')
//import user from '/cypress/fixtures/user.json'
const some_name = "Tauschbörse"

context('Login', () => {
  beforeEach(() => {
    let user;
    //var user = {email: Date.now().toString() + "@gmail.com", first_name: "Jonas", last_name: "Müller"};
    //cy.wrap(user).as('user')
    //cy.get('@user').then(user => {
    //  expect(user["first_name"]).to.contain("Jonas")
    //})

    cy.request('https://randomuser.me/api/?results=10').then(
      (response) => {
        cy.log(response.body["results"][0]["name"]["first"])
        // response.body is automatically serialized into JSON
        //expect(response.body).to.have.property('name', 'Jane') // true
        user = {email: response.body["results"][0]["email"], first_name: response.body["results"][0]["name"]["first"], last_name: response.body["results"][0]["name"]["last"]};
        cy.wrap(user).as('user')
        // other test code here
        cy.login(user["email"], user["first_name"], user["last_name"], "password")
      }
    )

  })

  // https://on.cypress.io/interacting-with-elements

  it('visits the front page', () => {

    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.get('body').contains('Tauschbörse')

    //cy.get('@user').then(user => {
    //  expect(user["first_name"]).to.contain("Jonas")
    //})
  })

  it('visits mein Impulse', () => {
    // https://on.cypress.io/type
    //cy.get('body').should('have.value', 'Tauschbörse')
    cy.contains('Mein Impulse').click()
    cy.contains('Mein Impulse')
    cy.get('@user').then(user => {
      cy.contains(user["first_name"])
      cy.contains(user["last_name"])
      cy.contains(user["email"])
    })
    //cy.get('body').contains(first_name)
  })

})
