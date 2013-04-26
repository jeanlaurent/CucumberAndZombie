should = require('chai').should()
Browser = require('zombie')

home = 'http://localhost:8080/'

describe 'Order product throught a basket', ->

	it 'should add a product to the basket area', ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.text('#nb-article').should.have.string '1 article'

	it 'should add two products to the basket area', ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.clickLink '#mon-cahier-3', ->
					browser.text('#nb-article').should.have.string '2 articles'

	it 'should change the quantity of a product from the basket page', ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.visit "#{home}/cart", ->
					browser.fill '.changeAmount', 2, ->
						browser.text('.prix_total').should.have.string '18.0'

	it 'should order a product', ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.visit "#{home}/order.html", ->
					browser.fill("prenom", "Headless")
					browser.fill("nom", "Zombie")
					browser.fill("email", "headlesszombiemorlhon.net")
					browser.fill("nom_l", "Headless Zombie")
					browser.fill("adresse_l", "66 rue ambroise croizat")
					browser.fill("adresse_complement_l", "this rocks")
					browser.fill("code_postal_l", "78800")
					browser.fill("ville_l", "Houilles")
					browser.select("pays_l", "france")
					browser.check("cgv")
					browser.pressButton "#validate", ->
						browser.queryAll('h2')[0].textContent.should.have.string 'Merci !'

