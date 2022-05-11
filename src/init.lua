--!strict
--[=[
  @class URL

  Utility methods for working with URLs.
]=]
local URL = {
	normalisePath = require(script.normalisePath),
	params = require(script.params),
	parse = require(script.parse),
	stringify = require(script.stringify),
}

return URL
