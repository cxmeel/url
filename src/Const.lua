--!strict
local _T = require(script.Parent.Types)

local AUTHORITIES = {
	"http:",
	"https:",
	"ftp:",
	"ftps:",
	"ws:",
	"wss:",
}

local DEFAULT_PARSED: _T.URL = {
	scheme = "http:",
	username = "",
	password = "",
	host = "",
	hostname = "",
	port = "",
	origin = "",
	path = "/",
	query = "",
	hash = "",
	href = "",
}

return {
	AUTHORITIES = AUTHORITIES,
	DEFAULT_PARSED = DEFAULT_PARSED,
}
