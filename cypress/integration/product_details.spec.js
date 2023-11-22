/// <reference types="cypress" />

describe('jungle-app', () => {
  beforeEach(() => {
    
    cy.visit('http://localhost:3000/')
  })

  it('displays product page', () => {

    cy.get('article').first().click().get('.product-detail').should('exist')

  })

})
