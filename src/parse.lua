--!strict
local CONST = require(script.Parent.Const)
local _T = require(script.Parent.Types)

local Util = require(script.Parent.Util)

local normalisePath = require(script.Parent.normalisePath)
local stringify = require(script.Parent.stringify)

local includes = table.find
local split = string.split
local join = table.concat
local pop = table.remove
local gsub = string.gsub
local sub = string.sub

--[=[
  @function parse
  @within URL

  @param url string -- The URL to parse.
  @return URL -- The parsed URL.

  Parses a URL into a URL object.

  ```lua
  local value = URL.parse("https://example.com:8080/path?query=true#hash")

  value.hostname -- "example.com"
  value.port -- 8080
  value.path -- "path"
  value.query -- "query=true"
  value.hash -- "hash"
  value.scheme -- "https:"
  ```
]=]
local function parse(url: string): _T.URL
	local parsed: _T.URL = Util.Dictionary.copy(CONST.DEFAULT_PARSED)

	-- Throw if URL is nil or empty.
	assert(Util.String.nonEmpty(url), "Cannot parse an empty or `nil` URL.")

	-- Trim whitespace from the beginning and end of the URL.
	url = Util.String.trim(url)

	-- Remove leading double slashes.
	if sub(url, 1, 2) == "//" then
		url = url:sub(3)
	end

	-- Parse the scheme.
	url = gsub(url, "^([%w%.%-_]*:)/?/?", function(scheme)
		parsed.scheme = scheme
		return ""
	end)

	-- Parse hash.
	url = gsub(url, "#(.*)$", function(hash)
		parsed.hash = hash
		return ""
	end)

	-- Parse query string.
	url = gsub(url, "%?(.*)$", function(query)
		parsed.query = query
		return ""
	end)

	-- Parse path.
	url = gsub(url, "/(.*)$", function(path)
		parsed.path = if sub(path, -1) == "/" then sub(path, 1, -2) else path
		return ""
	end)

	parsed.path = normalisePath(parsed.path)

	-- Parse credentials.
	url = gsub(url, "^([^@]*)@", function(credentials)
		local values = split(credentials, ":")

		parsed.username = pop(values, 1) or ""
		parsed.password = join(values, ":")

		return ""
	end)

	-- Parse port.
	local suppliedPort

	url = gsub(url, ":([^:%]]*)$", function(port)
		parsed.port, suppliedPort = port, port
		return ""
	end)

	-- Set hostname.
	parsed.hostname = url

	-- Stitch together the hostname and port.
	parsed.host = parsed.hostname

	if suppliedPort then
		parsed.host ..= ":" .. parsed.port
	end

	-- Stitch together origin.
	if includes(CONST.AUTHORITIES, parsed.scheme) then
		parsed.origin = parsed.scheme .. "//" .. parsed.host
	else
		parsed.origin = parsed.scheme .. parsed.host
	end

	-- Generate and set href.
	parsed.href = stringify(parsed)

	return parsed
end

return parse
