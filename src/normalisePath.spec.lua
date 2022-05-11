return function()
	local normalisePath = require(script.Parent.normalisePath)

	local TEST_PATHS = {
		-- { input, expected }
		{ "/", "/" },
		{ "/lorem", "/lorem" },
		{ "/lorem/ipsum", "/lorem/ipsum" },
		{ "/lorem/../ipsum", "/ipsum" },
		{ "/lorem/../../ipsum", "/ipsum" },
		{ "/./lorem/../ipsum", "/ipsum" },
		{ "/./lorem/ipsum/../dolor/../sit", "/lorem/sit" },
		{ "lorem/./ipsum", "lorem/ipsum" },
	}

	describe("basic path normalisation", function()
		for _, testPaths in pairs(TEST_PATHS) do
			local input, expected = testPaths[1], testPaths[2]

			it('should normalise the path "' .. input .. '" to "' .. expected .. '"', function()
				local normalised = normalisePath(input)

				expect(normalised).to.be.ok()
				expect(normalised).to.equal(expected)
			end)
		end
	end)
end
