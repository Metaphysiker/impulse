/// <reference types="cypress" />

context('Actions', () => {
  beforeEach(() => {
    cy.visit('localhost:3000')
  })

  // https://on.cypress.io/interacting-with-elements

  it('visits the front page', () => {
    // https://on.cypress.io/type

      cy.get('.form_for_user').within(($form) => {
      // you have access to the found form via
      // the jQuery object $form if you need it

      // cy.get() will only search for elements within form,
      // not within the entire document
      cy.get('#user_email').type('john.doe@email.com')
      cy.get('input[name="password"]').type('password')
      cy.root().submit()
    })

  })
})
