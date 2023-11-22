/// <reference types="cypress" />

describe('jungle-app', () => {
  beforeEach(() => {
    
    cy.visit('http://localhost:3000/')
  })

  it('cart goes up', () => {

    cy.get('.cart-num').then(($num1) => {
      const num1 = Number($num1.text()) + 1
      cy.get('.btn')
      .first()
      .click({force: true})
      .get('.cart-num').should(($num2) => {
        const num2 = Number($num2.text())
        expect(num2).to.eq(num1)
      })
    })
  })
})