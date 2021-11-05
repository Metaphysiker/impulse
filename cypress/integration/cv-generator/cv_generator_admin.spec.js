describe('CvGenerator Admin', () => {

  before(function () {
    cy.request('http://localhost:3000/test_data/generate_json_of_translation')
  })

  beforeEach(function () {

    cy.request('http://localhost:3000/test_data/destroy_all_cv_units')
    cy.request('http://localhost:3000/test_data/destroy_all_users')
    cy.request('http://localhost:3000/test_data/destroy_all_cvs')
    cy.request('http://localhost:3000/test_data/generate_first_batch_of_users')
    cy.request('http://localhost:3000/test_data/generate_second_batch_of_users')
    cy.request('http://localhost:3000/test_data/generate_fake_admins_and_json')

    cy.visit('http://localhost:3000')

    cy.readFile('cypress/fixtures/first_batch_of_admins.json').then((users) => {
      cy.login(users[0]);
    });

  })

  afterEach(function(){
    cy.logout();
  })

  it('visits admin_area and expects to see people', () => {
    cy.fixture('locales/de.json').should((de) => {
      cy.contains(de["de"]["admin_area"]).should('be.visible');
    })

    cy.get('[data-cy=admin_area_button]').first().click();

    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      for (var number in users) {
        cy.contains(users[number]["first_name"]).should('be.visible');
        cy.contains(users[number]["last_name"]).should('be.visible');
      }
    });
  })

  it('tries to generate cvs with another user', () => {

    cy.get('[data-cy=admin_area_button]').first().click();

    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      cy.contains(users[0]["first_name"] + " " + users[0]["last_name"]).first().parent().within(() => {
        cy.get('[data-cy=create_cvs_for_this_user_button]').first().click();
      })
    });

    cy.readFile('cypress/fixtures/second_batch_of_users.json').then((users) => {
      cy.create_cvs(users[0])
    });

  })

  it('tries to delete another user', () => {

    cy.get('[data-cy=admin_area_button]').first().click();

    cy.readFile('cypress/fixtures/first_batch_of_users.json').then((users) => {
      cy.contains(users[0]["first_name"] + " " + users[0]["last_name"]).first().parent().within(() => {
        cy.get('[data-cy=delete_user_button]').first().click();
      })
      cy.contains("Account wurde gelöscht!");
      cy.contains(users[0]["first_name"] + " " + users[0]["last_name"]).should('not.exist');
    });



  })

  it("expects to see basic functionalities in admin-area", () => {

    cy.get('[data-cy=admin_area_button]').first().click();

    cy.fixture('locales/de.json').should((de) => {
      cy.contains(de["de"]["view_cvs"]);
      cy.get('[data-cy=view_cvs_of_this_user_button]').should('be.visible');

      cy.contains(de["de"]["create_new_cvs"]);
      cy.get('[data-cy=create_cvs_for_this_user_button]').should('be.visible');

      cy.contains(de["de"]["edit_user"]);
      cy.get('[data-cy=edit_user_button]').should('be.visible');

      cy.contains(de["de"]["are_you_in_mentoring50"]);
    })
  })
})
