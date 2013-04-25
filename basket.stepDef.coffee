
stepDefinitions = ->

	@World = require('./support.coffee').World

	@Given /^I'm on the homepage$/, (callback) ->
		@browser.visit @home, callback

	@When /^I order a product$/, (callback) ->
		@browser.clickLink '#mon-cahier-3', callback

	@Then /^the product quantity (\d+) is shown in the basket$/, (quantity, callback) ->
		@browser.text('#nb-article').should.have.string "#{quantity} article"
		callback()

	@When /^I go to the basket page$/, (callback) ->
		@browser.visit "#{@home}/cart", callback

	@When /^I input (\d+) as quantity for my product$/, (quantity, callback) ->
		@browser.fill '.changeAmount', quantity, callback

	@Then /^the basket price is now (.+)$/, (price, callback) ->
		@browser.text('.prix_total').should.have.string price
		callback()

	@When /^I validate my basket$/, (callback) ->
		@browser.visit "#{@home}/order.html", ->
			callback()

	@When /^I fill the form and validate it$/, (callback) ->
		@browser.fill("prenom", "Headless")
		@browser.fill("nom", "Zombie")
		@browser.fill("email", "headlesszombie@morlhon.net")
		@browser.fill("nom_l", "Headless Zombie")
		@browser.fill("adresse_l", "66 rue ambroise croizat")
		@browser.fill("adresse_complement_l", "this rocks")
		@browser.fill("code_postal_l", "78800")
		@browser.fill("ville_l", "Houilles")
		@browser.select("pays_l", "france")
		@browser.check("cgv")
		@browser.pressButton "#validate", ->
			callback()

	@Then /^I see my order has been fullfilled$/, (callback) ->
		@browser.queryAll('h2')[0].textContent.should.have.string 'Merci !'
		callback()

module.exports = stepDefinitions