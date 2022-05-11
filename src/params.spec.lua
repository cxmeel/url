return function()
	local params = require(script.Parent.params)

	local TEST_QUERIES = {
		-- { input, expected }
		{ "?hello=world", { hello = "world" } },
		{ "hello=world", { hello = "world" } },
		{ "?hello=world&lorem=ipsum", { hello = "world", lorem = "ipsum" } },
		{ "#token=value", { ["#token"] = "value" } },
	}

	describe("basic query parsing", function()
		for _, testQueries in pairs(TEST_QUERIES) do
			local input, expected = testQueries[1], testQueries[2]

			describe('should parse the query "' .. input .. '"', function()
				local parsed = params(input)

				expect(parsed).to.be.ok()
				expect(parsed).to.be.a("table")

				for key, value in pairs(expected) do
					it('should contain the key "' .. key .. '" with value "' .. tostring(value) .. '"', function()
						expect(parsed[key]).to.equal(value)
					end)
				end
			end)
		end
	end)
end
