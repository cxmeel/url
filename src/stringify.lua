--!strict
local CONST = require(script.Parent.Const)
local _T = require(script.Parent.Types)

local Util = require(script.Parent.Util)

local nonEmpty = Util.String.nonEmpty
local includes = table.find
local push = table.insert
local join = table.concat
local sub = string.sub

--[=[
  @function stringify
  @within URL

  @param url URL -- The URL object to stringify.
  @return string -- The stringified URL.

  Transforms a previously parsed URL object back into a string.

  ```lua
  local parsed = URL.parse("https://example.com:8080/path?query#hash")
  local value = URL.stringify(parsed) -- "https://example.com:8080/path?query#hash"
  ```
]=]
local function stringify(url: _T.URL): string
	url = Util.Dictionary.merge(CONST.DEFAULT_PARSED, url)

	local newUrl = {}

	if nonEmpty(url.path) and url.path ~= "/" then
		if sub(url.path, 1, 1) == "/" then
			push(newUrl, url.path)
		else
			push(newUrl, "/" .. url.path)
		end
	end

	if nonEmpty(url.query) then
		push(newUrl, "?" .. url.query)
	end

	local authority = url.host

	if authority then
		local credentials

		if nonEmpty(url.username) then
			credentials = url.username

			if nonEmpty(url.password) then
				credentials ..= ":" .. url.password
			end
		end

		if credentials then
			authority = credentials .. "@" .. authority
		end

		if includes(CONST.AUTHORITIES, url.scheme) then
			push(newUrl, 1, "//" .. authority)
		else
			push(newUrl, 1, authority)
		end
	end

	if nonEmpty(url.scheme) then
		push(newUrl, 1, url.scheme)
	end

	if nonEmpty(url.hash) then
		push(newUrl, "#" .. url.hash)
	end

	return join(newUrl, "")
end

return stringify
