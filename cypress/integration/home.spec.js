/// <reference types="cypress" />

describe('jungle-app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('http://localhost:3000/')
  })

  it('displays "Welcome to"', () => {
    // We use the `cy.get()` command to get all elements that match the selector.
    // Then, we use `should` to assert that there are two matched items,
    // which are the two default items.
    cy.get('h3').should('have.text', "Welcome to")

  })

  it("There is products on the page", () => {
      cy.get(".products article").should("be.visible");
  })

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });

})
