local vim_modes = {
	n = "n",
	i = "i",
	v = "v",
}
local default_opts = {
	noremap = true,
	silent = true,
}

local get_mode = function(mode)
	local modeString = vim_modes[mode]
	if modeString == nil then
		return "n"
	end
	return modeString
end
local get_opts = function(opts)
	local all_opts = opts
	if all_opts == nil then
		all_opts = {}
	end
	for k, v in pairs(default_opts) do
		all_opts[k] = all_opts[k] or v
	end
	return all_opts
end

local map = function(vimmode, keymap, command, vimopts)
	local mode = get_mode(vimmode)
	local lhs = keymap
	local rhs = command
	local opts = get_opts(vimopts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

return { map = map }
