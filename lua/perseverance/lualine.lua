-- Safely require lualine.
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    vim.notify("There have been issues in requiring lualine!")
	return
end


-- Things that will be shown on lualine.
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " },
    cond = hide_in_width
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = ""
}

local location = {
	"location",
	padding = 0
}

local function os_icon()
    -- Function that returns icon representing the OS you are running.
    if vim.fn.has('mac') == 1 then
        return ''
    elseif vim.fn.has('win32') == 1 then
        return ''
    else
        return ''
    end
end

local spaces = function()
    -- Get the number of spaces the tab takes up.
	return "Tab Size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end


lualine.setup({
    -- UI options for lualine.
	options = {
		theme = "auto",
		icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
     	always_divide_middle = true
	},

    -- Elements of lualine.
	sections = {
		lualine_a = { mode },
		lualine_b = { diagnostics },
		lualine_c = { branch },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location, "searchcount", "selectioncount" },
		lualine_z = {"progress", os_icon },
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {},

	extensions = {},
})
