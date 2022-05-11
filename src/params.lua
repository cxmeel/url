--!strict

local split = string.split
local match = string.match
local sub = string.sub

--[=[
  @function params
  @within URL

  @param query string -- The query string to parse.
  @return table -- The parsed query string.

  Parses a query string into a table. A leading `?` will be
  removed from the query string.

  ```lua
  local query = "?lorem=ipsum&dolor=sit&amet=consectetur"

  local value = params(query) -- {lorem = "ipsum", dolor = "sit", amet = "consectetur"}
  ```
]=]
local function params(query: string): { [string]: string }
	local result = {}

	if sub(query, 1, 1) == "?" then
		query = sub(query, 2)
	end

	for _, kvpair in pairs(split(query, "&")) do
		local key, value = match(kvpair, "^([^=]+)=(.*)$")

		result[key] = value
	end

	return result
end

return params
