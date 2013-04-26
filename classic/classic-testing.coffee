should = require('chai').should()
Browser = require('zombie')

home = 'http://localhost:8080/'

describe 'Order product throught a basket', ->

	it 'should add a product to the basket area', (done) ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.text('#nb-article').should.have.string '1 article'
				done()

	it 'should add two products to the basket area', (done) ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.clickLink '#mon-cahier-3', ->
					browser.text('#nb-article').should.have.string '2 articles'
					done()

	it 'should change the quantity of a product from the basket page', (done) ->
		browser = new Browser()
		browser.visit "#{home}", ->
			browser.clickLink '#mon-cahier-3', ->
				browser.visit "#{home}/cart", ->
					browser.fill '.changeAmount', 2, ->
						browser.text('.prix_total').should.have.string '18.0'
						done()

