--!strict
local STOP_CHAR = string.char(1)

local gsub = string.gsub

--[=[
	@function normalisePath
	@within URL

	@param path string -- The path to normalise.
	@return string -- The normalised path.

	Normalises a URL path, removing dot segments and resolving relative paths.

	```lua
	local path = "/./lorem/ipsum/../dolor/../sit"

	local value = normalisePath(path) -- "/lorem/sit"
	```
]=]
local function normalisePath(path: string): string
	repeat
		local previous = path
		path = gsub(path, "//", "/" .. STOP_CHAR .. "/", 1)
	until previous == path

	repeat
		local previous = path
		path = gsub(path, "/%./", "/", 1)
	until previous == path

	repeat
		local previous = path
		path = gsub(path, "[^/]+/%.%./([^/]+)", "%1", 1)
	until previous == path

	path = gsub(path, "[^/]+/%.%./*$", "")
	path = gsub(path, "/%.%.$", "/")
	path = gsub(path, "/%.$", "/")
	path = gsub(path, "^/%.%./", "/")
	path = gsub(path, STOP_CHAR, "")

	return path
end

return normalisePath
