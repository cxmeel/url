--!strict

--[=[
	@interface URL
	@within URL
	.scheme string -- The scheme of the URL, including the `":"`; e.g. `"https:"`
	.username string -- The username specified before the domain name.
	.password string -- The password specified before the domain name.
	.host string -- The domain name (`.hostname`) followed by the port if specified (`.port`); e.g. `"csqrl.dev:1337"`
	.hostname string -- The domain name; e.g. `"csqrl.dev"`
	.port string -- The port number if specified; e.g. `"1337"`
	.origin string -- The origin of the URL; e.g. `"https://csqrl.dev:1337"`
	.path string -- The path of the URL, excluding the leading `"/"`, query string and hash fragment; e.g. `"path/to/file"`
	.query string -- The query string of the URL, excluding the leading `"?"` and hash fragment; e.g. `"param=value"`
	.hash string -- The hash fragment of the URL, excluding the leading `"#"`; e.g. `"hash"`
	.href string -- The full URL; e.g. `"https://csqrl.dev:1337/path/to/file?param=value#hash"`
]=]
export type URL = {
	scheme: string,
	username: string,
	password: string,
	host: string,
	hostname: string,
	port: string,
	origin: string,
	path: string,
	query: string,
	hash: string,
	href: string,
}

return nil
