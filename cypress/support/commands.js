// ***********************************************
// This example commands.js shows you how to
// create various custom commands and overwrite
// existing commands.
//
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
//
//
// -- This is a parent command --
Cypress.Commands.add('login', (email, first_name, last_name, password) => {
  cy.visit('localhost:3000')
  //cy.get('body').contains('Tauschbörse')
  cy.get('.form_for_user').within(($form) => {
  // you have access to the found form via
  // the jQuery object $form if you need it

  // cy.get() will only search for elements within form,
  // not within the entire document
  cy.get('#user_email').type(email)
  cy.get('#user_first_name').type(first_name)
  cy.get('#user_last_name').type(last_name)
  cy.get('#user_password').type(password)
  cy.root().submit()
  //cy.get('.alert-info').should('be.visible')
  //cy.wait(3000);
  //cy.get('body').should('have.value', "Tauschbörse")

  //cy.get('body').contains('Account wurde erstellt!')
  })
  cy.wait(1000)
  cy.get('body').contains('Account wurde erstellt!')
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
