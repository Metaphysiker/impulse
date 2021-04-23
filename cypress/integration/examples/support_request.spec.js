/// <reference types="cypress" />
//const requiredExample = require('../../fixtures/user')
//import user from '/cypress/fixtures/user.json'
const model_name_singular_german = "Call for Help"
const model_name_plural_german = "Call for Help"
const model_name = "support_request"
const model_name_plural = "support_requests"

const lorem_ipsum_title = "Lorem Ipsum"
const lorem_ipsum_content = "Lorem Ipsum Content"

const lorem_ipsum_title_updated = "Lorem Ipsum Updated"
const lorem_ipsum_content_updated = "Lorem Ipsum Content Updated"

const area_of_expertise = "Lebenslauf-Gestaltung"

context('basic test with login', () => {
  beforeEach(() => {
    let user;
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

  it('visits index and creates, edits and deletes support request', () => {

    cy.visit('localhost:3000')
    //cy.contains(model_name).click()

    cy.get("[data-cy=" + model_name_plural + "]").click()
    cy.get('h1').contains(model_name_singular_german)

    //create
    cy.get("[data-cy=create_" + model_name + "]").click()
    cy.get("[data-cy=form_" + model_name + "]").within(($form) => {
      cy.get('#' + model_name + '_title').type(lorem_ipsum_title)
      cy.get('#' + model_name + '_content').type(lorem_ipsum_content)
      //cy.get('#' + model_name + '_area_of_expertise').select(area_of_expertise)
      cy.root().submit()
    })

    cy.contains(model_name_singular_german + " wurde erstellt!")
    cy.get("." + model_name + "_card").contains(lorem_ipsum_title)
    cy.get("." + model_name + "_card").contains(lorem_ipsum_content)

    //get id

    cy.get("[data-cy=" + model_name + "_id]")
      .invoke('attr', 'data-cy')


    //cy.get("[data-cy=" + model_name + "_id]")
    //  .invoke('attr', 'data-cy-support_request-id').should('eq', 'yolo')
      cy.get("[data-cy=" + model_name + "_id]")
      .invoke('attr', 'data-cy-support_request-id').as('support_request_id')

      cy.get('@support_request_id').then( support_request_id => {
        cy.log(support_request_id);

        //edit
        cy.get("[data-cy=edit-" + model_name + "-" + support_request_id + "]").click()
        cy.get("[data-cy=form_" + model_name + "]").within(($form) => {
          cy.get('#' + model_name + '_title').clear().type(lorem_ipsum_title_updated)
          cy.get('#' + model_name + '_content').clear().type(lorem_ipsum_content_updated)
          //cy.get('#' + model_name + '_area_of_expertise').select(area_of_expertise)
          cy.root().submit()
        })

        cy.contains(model_name_singular_german + " wurde aktualisiert!")
        cy.get("." + model_name + "_card").contains(lorem_ipsum_title_updated.toUpperCase())
        cy.get("." + model_name + "_card").contains(lorem_ipsum_content_updated)

        //delete
        cy.get("[data-cy=delete_" + model_name + "-" + support_request_id + "]").click()
        cy.contains(model_name_singular_german + " wurde entfernt!")
        cy.contains(lorem_ipsum_title_updated).should('not.exist')
        cy.contains(lorem_ipsum_content_updated).should('not.exist')

      });

    //cy.get("[data-cy=" + model_name + "_id]").its('data-cy').should('eq', 'yolo')



  })

})
