--!strict

local function trim(base: string): string
	local result = base:match("^%s*(.-)%s*$")
	return result or ""
end

local function nonEmpty(base: string): boolean
	return type(base) == "string" and base ~= ""
end

return {
	trim = trim,
	nonEmpty = nonEmpty,
}
