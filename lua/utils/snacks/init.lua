local M = {}

local snacks_path = vim.fn.stdpath("config") .. "/lua/plugins/snacks/"

function M.get_config(path)
	local modules = {}
	local modules_path = path or snacks_path

	local success, files = pcall(vim.fn.readdir, modules_path)
	if not success then
		return modules
	end

	local function process_file(file_path)
		local ok, result = pcall(loadfile, file_path)
		if ok and result then
			local module_result = result()
			if type(module_result) == "table" then
				if module_result.config then
					for k, v in pairs(module_result.config) do
						modules[k] = v
					end
				end
			end
		end
	end

	for _, module in pairs(files) do
		if module:match("%.lua$") and not module:match("init.lua$") then
			process_file(modules_path .. module)
		end
	end

	return modules
end

function M.load_keymaps(path)
	local modules_path = path or snacks_path

	local success, files = pcall(vim.fn.readdir, modules_path)
	if not success then
		return
	end

	local function process_keymaps(file_path)
		local ok, result = pcall(loadfile, file_path)
		if ok and result then
			local module_result = result()
			if type(module_result) == "table" and module_result.keymaps then
				-- Keymaps are executed during module load
			end
		end
	end

	for _, module in pairs(files) do
		if module:match("%.lua$") and not module:match("init.lua$") then
			process_keymaps(modules_path .. module)
		end
	end
end

return M
