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
Cypress.Commands.add('login', (user) => {
  cy.visit('http://localhost:3000/users/sign_in')
  cy.get("[data-cy=form_for_login]").within(($form) => {
    cy.get('#user_email').type(user["email"])
    cy.get('#user_password').type("password")
    cy.root().submit()
  })
  cy.contains('Erfolgreich angemeldet.')

  cy.fixture('locales/de.json').should((de) => {
    cy.contains(de["de"]["logged_in_as"] + " " + user["email"]);
  });
})

Cypress.Commands.add('signup', (user) => {
  cy.visit('http://localhost:3000/users/sign_up')
  cy.get("[data-cy=form_for_registration]").within(($form) => {
    cy.get('#user_email').type(user["email"])
    cy.get('#user_are_you_in_mentoring50_true').check()
    cy.get('#user_password').type("password")
    cy.get('#user_password_confirmation').type("password")
    cy.root().submit()
  })
  cy.contains('Sie haben sich erfolgreich registriert!')

  cy.fixture('locales/de.json').should((de) => {
    cy.contains(de["de"]["logged_in_as"] + " " + user["email"]);
  });

})

Cypress.Commands.add('create_cvs', (user) => {
  cy.get('[data-cy=update_user_for_cv_form]').within(($form) => {
      //cy.get('#user_email').clear().type(user.email)
      //cy.get('#user_email').type(unique_email)
      //cy.get('#user_password').type("password")
      cy.get('#user_first_name').clear().type(user.first_name)
      cy.get('#user_last_name').clear().type(user.last_name)
      cy.get('#user_location').clear().type(user.location)
      cy.get('#user_plz').clear().type(user.plz)
      cy.get('#user_street').clear().type(user.street)
      cy.get('#user_phone').clear().type(user.phone)
      cy.get('#user_birth_day_3i').select(Number(user.birth_day.split("-")[2]).toString());
      cy.get('#user_birth_day_2i').select(Number(user.birth_day.split("-")[1]).toString())
      cy.get('#user_birth_day_1i').select(Number(user.birth_day.split("-")[0]).toString())
      cy.get('#user_job_title').clear().type(user.job_title)
      cy.get('#user_website').clear().type(user.website)
      cy.get('#user_short_description').clear().type(user.short_description)
      cy.get('#user_long_description').clear().type(user.long_description)
      cy.get('#user_power_word1').clear().type(user.power_word1)
      cy.get('#user_power_word2').clear().type(user.power_word2)
      cy.get('#user_power_word3').clear().type(user.power_word3)
      cy.get('#user_quote').clear().type(user.quote)
      cy.get('#user_nationality').clear().type(user.nationality)
      cy.get('#user_marital_status').clear().type(user.marital_status)

    cy.root().submit()
  })

  cy.fill_in_cv_unit("experience");
  cy.fill_in_cv_unit("education");
  cy.fill_in_skills_cv_unit("skills");
  cy.get('[data-cy=cv_generator_loading_screen_button]').first().click();
  cy.request('http://localhost:3000/cv_generator/available_templates').then((templates) => {
    for (var index = 0; index < templates.body.length; index++) {
      cy.contains("Erstellt: " + index, { timeout: 10000 }).should('be.visible');
    }
  })

  cy.url().should('include', '/my_cvs');
  cy.contains("Lebenslauf auswählen").should('be.visible');

  cy.request('http://localhost:3000/cv_generator/available_templates').then((templates) => {
    for (var index = 0; index < templates.body.length; index++) {
      cy.contains(templates.body[index]).should('be.visible');

      cy.get('[data-cy=download_odt_' + templates.body[index] +']').should('be.visible');
    }
  })

    for (var attribute in user) {
      if(attribute !== "email"){
        cy.contains(user[attribute]);
      }
    }


  cy.readFile('cypress/fixtures/cv_unit_education_edited.json').then((user) => {
    for (var attribute in user) {
      cy.contains(user[attribute]);
    }
  });

  cy.readFile('cypress/fixtures/cv_unit_experience_edited.json').then((user) => {
    for (var attribute in user) {
      cy.contains(user[attribute]);
    }
  });

  cy.readFile('cypress/fixtures/cv_unit_skills_edited.json').then((user) => {
    for (var attribute in user) {
      cy.contains(user[attribute]);
    }
  });

})

Cypress.Commands.add('fill_in_cv_unit', (cv_unit_category) => {

  cy.get("[data-cy=new-entry-in-" + cv_unit_category + "]").click();

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
        cy.get("[data-cy=edit_cv_unit]").click();
      });

      cy.get("[data-cy=go_back]").first().click();

      cy.contains(cv_unit.name).parent().within(($parent) => {
        cy.get("[data-cy=edit_cv_unit]").click();
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
  cy.get("[data-cy=new-entry-in-" + cv_unit_category + "]").click();

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
        cy.get("[data-cy=edit_cv_unit]").click();
      });

      cy.get("[data-cy=go_back]").first().click();

      cy.contains(cv_unit.name).parent().within(($parent) => {
        cy.get("[data-cy=edit_cv_unit]").click();
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
  cy.contains('Erfolgreich abgemeldet.');
})

Cypress.Commands.add('destroy_user_account', () => {
  cy.visit('localhost:3000');
  cy.get("[data-cy=destroy_user_account]").first().click();
  cy.contains('Ihr Konto wurde gelöscht. Wir hoffen, dass wir Sie bald wiedersehen.');
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
  cy.contains('Account wurde erstellt!').should('be.visible') ;
  cy.logout();
})

Cypress.Commands.add('create_support_request', () => {

  cy.visit('localhost:3000');
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
