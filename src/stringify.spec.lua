return function()
	local stringify = require(script.Parent.stringify)

	local TEST_URLS = {
		["https://github.com/csqrl/url/blob/main/src/stringify.spec.lua#L5"] = {
			scheme = "https:",
			host = "github.com",
			path = "csqrl/url/blob/main/src/stringify.spec.lua",
			hash = "L5",
		},

		["https://devforum.roblox.com"] = {
			scheme = "https:",
			host = "devforum.roblox.com",
		},

		["mailto:e@csqrl.dev"] = {
			scheme = "mailto:",
			host = "csqrl.dev",
			username = "e",
		},
	}

	describe("basic URL stringification", function()
		for expected, url in pairs(TEST_URLS) do
			it('should stringify the url object to: "' .. expected .. '"', function()
				local stringified = stringify(url)

				expect(stringified).to.be.ok()
				expect(stringified).to.equal(expected)
			end)
		end
	end)
end
