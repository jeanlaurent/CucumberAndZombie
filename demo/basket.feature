Feature: Order products through a basket

Scenario: Add one product to the basket from the homepage
	Given I'm on the homepage
	When I order a product
	Then the product quantity 1 is shown in the basket

Scenario: Add two products to the basket from the homepage
	Given I'm on the homepage
	When I order a product
	And I order a product
	Then the product quantity 2 is shown in the basket

Scenario: Change the  quantity of a product in the basket
	Given I'm on the homepage
	When I order a product
	And I go to the basket page
	And I input 2 as quantity for my product
	Then the basket price is now 18.0

Scenario: I can order a product
	Given I'm on the homepage
	When I order a product
	And I validate my basket
	And I fill the form and validate it
	Then I see my order has been fullfilled