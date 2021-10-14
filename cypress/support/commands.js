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
require('cypress-downloadfile/lib/downloadFileCommand');
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
Cypress.Commands.add('login', (email) => {
  cy.visit('http://localhost:3000/users/sign_in')
  cy.get("[data-cy=form_for_login]").within(($form) => {
    cy.get('#user_email').type(email)
    cy.get('#user_password').type("password")
    cy.root().submit()
  })
  cy.contains('Erfolgreich angemeldet.')
})

Cypress.Commands.add('signup', (email) => {
  cy.visit('http://localhost:3000/users/sign_up')
  cy.get("[data-cy=form_for_registration]").within(($form) => {
    cy.get('#user_email').type(email)
    cy.get('#user_password').type("password")
    cy.get('#user_password_confirmation').type("password")
    cy.root().submit()
  })
  cy.contains('Sie haben sich erfolgreich registriert.')
})

Cypress.Commands.add('fill_in_cv_unit', (cv_unit_category) => {
  cy.get("[data-cy=new-entry-in-" + cv_unit_category + "]").click()
  cy.get("[data-cy=form_for_cv_unit_category_" + cv_unit_category + "]").within(($form) => {
    cy.fixture("cv_unit_" + cv_unit_category + ".json").then((cv_unit) => {
      cy.get('#cv_unit_name').type(cv_unit.name)
      cy.get('#cv_unit_content').type(cv_unit.content)
      cy.get('#cv_unit_company').type(cv_unit.company)
      cy.get('#cv_unit_location').type(cv_unit.location)
      cy.get('#cv_unit_start_date_2i').select(cv_unit.start_date_2i)
      cy.get('#cv_unit_start_date_1i').select(cv_unit.start_date_1i)
      cy.get('#cv_unit_end_date_2i').select(cv_unit.end_date_2i)
      cy.get('#cv_unit_end_date_1i').select(cv_unit.end_date_1i)
    cy.root().submit()
    });
  });

  cy.fixture("cv_unit_" + cv_unit_category + ".json").then((cv_unit) => {
      cy.contains("Eintrag wurde gespeichert!");
      cy.contains(cv_unit.name);
      cy.contains(cv_unit.content);
      cy.contains(cv_unit.company);
      cy.contains(cv_unit.location);
      cy.contains(cv_unit.start_date_2i);
      cy.contains(cv_unit.start_date_1i);
      cy.contains(cv_unit.end_date_2i);
      cy.contains(cv_unit.end_date_1i);
      cy.contains(cv_unit.name).parent().within(($parent) => {
        cy.get("[data-cy=edit_cv_unit]").click()
      });
    });

    cy.fixture("cv_unit_" + cv_unit_category + "_edited.json").then((cv_unit_edited) => {
      cy.get("[data-cy=form_for_cv_unit_category_" + cv_unit_category + "]").within(($form) => {
          cy.get('#cv_unit_name').clear().type(cv_unit_edited.name)
          cy.get('#cv_unit_content').clear().type(cv_unit_edited.content)
          cy.get('#cv_unit_company').clear().type(cv_unit_edited.company)
          cy.get('#cv_unit_location').clear().type(cv_unit_edited.location)
          cy.get('#cv_unit_start_date_2i').select(cv_unit_edited.start_date_2i)
          cy.get('#cv_unit_start_date_1i').select(cv_unit_edited.start_date_1i)
          cy.get('#cv_unit_end_date_2i').select(cv_unit_edited.end_date_2i)
          cy.get('#cv_unit_end_date_1i').select(cv_unit_edited.end_date_1i)
        cy.root().submit()
      });

      cy.fixture("cv_unit_" + cv_unit_category + "_edited.json").then((cv_unit_edited) => {
          cy.contains("Eintrag wurde aktualisiert!");
          cy.contains(cv_unit_edited.name);
          cy.contains(cv_unit_edited.content);
          cy.contains(cv_unit_edited.company);
          cy.contains(cv_unit_edited.location);
          cy.contains(cv_unit_edited.start_date_2i);
          cy.contains(cv_unit_edited.start_date_1i);
          cy.contains(cv_unit_edited.end_date_2i);
          cy.contains(cv_unit_edited.end_date_1i);
        });

    });
})

Cypress.Commands.add('fill_in_skills_cv_unit', (cv_unit_category) => {
  cy.get("[data-cy=new-entry-in-" + cv_unit_category + "]").click()
  cy.get("[data-cy=form_for_cv_unit_category_" + cv_unit_category + "]").within(($form) => {
    cy.fixture("cv_unit_" + cv_unit_category + ".json").then((cv_unit) => {
      cy.get('#cv_unit_name').type(cv_unit.name)
      cy.get('#cv_unit_content').type(cv_unit.content)
    cy.root().submit()
    });
  });

  cy.fixture("cv_unit_" + cv_unit_category + ".json").then((cv_unit) => {
      cy.contains("Eintrag wurde gespeichert!");
      cy.contains(cv_unit.name);
      cy.contains(cv_unit.content);
      cy.contains(cv_unit.name).parent().within(($parent) => {
        cy.get("[data-cy=edit_cv_unit]").click()
      });
    });

    cy.fixture("cv_unit_" + cv_unit_category + "_edited.json").then((cv_unit_edited) => {
      cy.get("[data-cy=form_for_cv_unit_category_" + cv_unit_category + "]").within(($form) => {
          cy.get('#cv_unit_name').clear().type(cv_unit_edited.name)
          cy.get('#cv_unit_content').clear().type(cv_unit_edited.content)
        cy.root().submit()
      });

      cy.fixture("cv_unit_" + cv_unit_category + "_edited.json").then((cv_unit_edited) => {
          cy.contains("Eintrag wurde aktualisiert!");
          cy.contains(cv_unit_edited.name);
          cy.contains(cv_unit_edited.content);
        });

    });
})



Cypress.Commands.add('logout', () => {
  cy.get("[data-cy=logout]").click()
  cy.contains('Erfolgreich abgemeldet.')
})

Cypress.Commands.add('destroy_user_account', () => {
  //cy.visit('localhost:3000');
  //cy.get("[data-cy=destroy_user_account]").first().click();
  //cy.contains('Ihr Konto wurde gelöscht. Wir hoffen, dass wir Sie bald wiedersehen.')
})

Cypress.Commands.add('create_regular_user_and_login', (email, first_name, last_name, password) => {
  cy.visit('localhost:3000');
  cy.get('.form_for_user').within(($form) => {
    cy.get('#user_email').type(email)
    cy.get('#user_first_name').type(first_name)
    cy.get('#user_last_name').type(last_name)
    cy.get('#user_password').type(password)
    const fixtureFile = 'images/stalin_portrait.jpg';
    cy.get('#user_cover').attachFile(fixtureFile);
    cy.root().submit()
  })
  cy.contains('Account wurde erstellt!');
  cy.logout();
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
