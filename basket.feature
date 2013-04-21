Feature: Add product to the basket

Scenario: Add one product to the basket from the homepage
	Given I'm on the homepage
	When I order the product mon-cahier-7
	Then the product quantity 1 is shown in the basket

Scenario: Add two products to the basket from the homepage
	Given I'm on the homepage
	When I order the product mon-cahier-5
	And I order the product mon-cahier-7
	Then the product quantity 2 is shown in the basket

Scenario: Change the quantity of a product in the basket
	Given I'm on the homepage
	When I order the product mon-cahier-5
	When I go to the basket page
	And I input 2 as quantity for mon-cahier-5
	Then the basket price is now 18.0

Scenario: I can order a product
	Given I'm on the homepage
	When I order the product mon-cahier-3
	When I go to the basket page
	And I validate my basket
	And I fill the form and validate
	Then I can see my order has been fullfilled
