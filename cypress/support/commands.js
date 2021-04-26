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
const model_name_singular_german = "Call for Help"
const model_name_plural_german = "Call for Help"
const model_name = "support_request"
const model_name_plural = "support_requests"

const lorem_ipsum_title = "Lorem Ipsum"
const lorem_ipsum_content = "Lorem Ipsum Content"

const lorem_ipsum_title_updated = "Lorem Ipsum Updated"
const lorem_ipsum_content_updated = "Lorem Ipsum Content Updated"
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

Cypress.Commands.add('create_support_request', () => {

  cy.visit('localhost:3000')
  //cy.contains(model_name).click()

  cy.get("[data-cy=" + model_name_plural + "]").click()
  cy.get('h1').contains(model_name_singular_german)

  //create
  cy.get("[data-cy=create_" + model_name + "]").click()
  cy.get("[data-cy=form_" + model_name + "]").within(($form) => {
    cy.get('#' + model_name + '_title').type(lorem_ipsum_title)
    cy.get('#' + model_name + '_content').type(lorem_ipsum_content)
    //cy.get('#' + model_name + '_expertise_ids').select('Lebenslauf', { force: true })
    cy.get('#' + model_name + '_expertise_ids').select(["Lebenslauf", "Bewerbungstraining"], { force: true })
    //cy.get('#favorite-state').select('MA', { force: true })
    //cy.get('#' + model_name + '_area_of_expertise').select(area_of_expertise)
    cy.root().submit()
  })
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
