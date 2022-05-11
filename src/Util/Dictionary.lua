--!strict

local function copy<T>(dictionary: T): T
	local new: any = {}

	for key, value in pairs(dictionary) do
		new[key] = value
	end

	return new
end

local function merge(...: { [any]: any })
	local new: any = {}

	for _, dictionary in ipairs({ ... }) do
		for key, value in pairs(dictionary) do
			new[key] = value
		end
	end

	return new
end

return {
	copy = copy,
	merge = merge,
}
