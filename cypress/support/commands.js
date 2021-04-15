// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
import 'cypress-file-upload';
//
//
// -- This is a parent command --
Cypress.Commands.add('login', (email, first_name, last_name, password) => {
  cy.visit('localhost:3000')
  //cy.get('body').contains('Tauschbörse')

  cy.get('.form_for_user').within(($form) => {
    cy.get('#user_email').type(email)
    cy.get('#user_first_name').type(first_name)
    cy.get('#user_last_name').type(last_name)
    cy.get('#user_password').type(password)
    const fixtureFile = 'images/stalin_portrait.jpg';
    cy.get('#user_cover').attachFile(fixtureFile);
    cy.root().submit()
  })

  //cy.wait(1000)
  cy.contains('Account wurde erstellt!')
})
//
//
// -- This is a child command --
// Cypress.Commands.add('drag', { prevSubject: 'element'}, (subject, options) => { ... })
//
//
// -- This is a dual command --
// Cypress.Commands.add('dismiss', { prevSubject: 'optional'}, (subject, options) => { ... })
//
//
// -- This will overwrite an existing command --
// Cypress.Commands.overwrite('visit', (originalFn, url, options) => { ... })
