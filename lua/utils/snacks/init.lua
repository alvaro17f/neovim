local M = {}

local snacks_path = vim.fn.stdpath("config") .. "/lua/plugins/snacks/"

local function load_module_files(path, process_fn)
	local modules_path = path or snacks_path
	local success, files = pcall(vim.fn.readdir, modules_path)
	if not success then
		return
	end

	for _, module in pairs(files) do
		if module:match("%.lua$") and not module:match("init.lua$") then
			local file_path = modules_path .. module
			local ok, result = pcall(loadfile, file_path)
			if ok and result then
				local module_result = result()
				if type(module_result) == "table" then
					process_fn(module_result, file_path)
				end
			end
		end
	end
end

function M.get_config(path)
	local modules = {}
	load_module_files(path, function(module_result)
		if module_result.config then
			for k, v in pairs(module_result.config) do
				modules[k] = v
			end
		end
	end)
	return modules
end

function M.load_keymaps(path)
	load_module_files(path, function(_) end)
end

return M
