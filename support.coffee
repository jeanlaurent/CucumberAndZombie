Browser = require('zombie')

World = (callback) ->
	@browser = new Browser()
	# @browser.debug = true
	@browser.waitFor = 1
	@home = 'http://127.0.0.1:8080'
	callback()

exports.World = World 