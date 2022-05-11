return function()
	local Parse = require(script.Parent.parse)

	local TEST_URLS = {
		["https://admin:password@csqrl.github.io:3000/path/to/file.php?query=string#hash"] = {
			scheme = "https:",
			hostname = "csqrl.github.io",
			path = "path/to/file.php",
			query = "query=string",
			hash = "hash",
			username = "admin",
			password = "password",
			port = "3000",
		},

		["http:localhost:8080?query=string#hash"] = {
			scheme = "http:",
			hostname = "localhost",
			path = "/",
			query = "query=string",
			hash = "hash",
			username = "",
			password = "",
			port = "8080",
		},

		["google.com/search?q=roblox"] = {
			scheme = "http:",
			hostname = "google.com",
			path = "search",
			query = "q=roblox",
			hash = "",
			username = "",
			password = "",
			port = "",
		},

		["csqrl.dev#!/home"] = {
			scheme = "http:",
			hostname = "csqrl.dev",
			path = "/",
			query = "",
			hash = "!/home",
			username = "",
			password = "",
			port = "",
		},

		["https:csqrl.github.io?test=1"] = {
			scheme = "https:",
			hostname = "csqrl.github.io",
			path = "/",
			query = "test=1",
			hash = "",
			username = "",
			password = "",
			port = "",
		},

		["http://[aaaa:bbbb:1:2::3]/test#true"] = {
			scheme = "http:",
			hostname = "[aaaa:bbbb:1:2::3]",
			path = "test",
			query = "",
			hash = "true",
			username = "",
			password = "",
			port = "",
		},

		["https://127.0.0.1:3000/api/test-page.html?yes=0"] = {
			scheme = "https:",
			hostname = "127.0.0.1",
			path = "api/test-page.html",
			query = "yes=0",
			hash = "",
			username = "",
			password = "",
			port = "3000",
		},

		["https://github.com/csqrl/url/blob/dev/../main/src/parse.spec.lua#L82"] = {
			scheme = "https:",
			hostname = "github.com",
			path = "csqrl/url/blob/main/src/parse.spec.lua",
			query = "",
			hash = "L82",
			username = "",
			password = "",
			port = "",
		},
	}

	describe("basic URL parsing", function()
		for url, expected in pairs(TEST_URLS) do
			it('should parse the url: "' .. url .. '"', function()
				local parsed = Parse(url)

				expect(parsed).to.be.ok()
				expect(parsed).to.be.a("table")

				expect(parsed.scheme).to.equal(expected.scheme)
				expect(parsed.hostname).to.equal(expected.hostname)
				expect(parsed.path).to.equal(expected.path)
				expect(parsed.query).to.equal(expected.query)
				expect(parsed.hash).to.equal(expected.hash)
				expect(parsed.port).to.equal(expected.port)
				expect(parsed.username).to.equal(expected.username)
				expect(parsed.password).to.equal(expected.password)
			end)
		end
	end)

	it("should throw if the url is nil or an empty string", function()
		expect(function()
			Parse(nil :: string)
		end).to.throw()

		expect(function()
			Parse("")
		end).to.throw()
	end)
end
