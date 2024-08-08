return {
	"goolord/alpha-nvim",
	enabled = false,
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[     _____          ___           ___           ___           ___           ___     ]],
			[[    /  /::\        /  /\         /__/\         /__/\         /  /\         /__/|    ]],
			[[   /  /:/\:\      /  /:/_        \  \:\        \  \:\       /  /::\       |  |:|    ]],
			[[  /  /:/  \:\    /  /:/ /\        \  \:\        \__\:\     /  /:/\:\      |  |:|    ]],
			[[ /__/:/ \__\:|  /  /:/ /:/_   _____\__\:\   ___ /  /::\   /  /:/~/::\   __|__|:|    ]],
			[[ \  \:\ /  /:/ /__/:/ /:/ /\ /__/::::::::\ /__/\  /:/\:\ /__/:/ /:/\:\ /__/::::\____]],
			[[  \  \:\  /:/  \  \:\/:/ /:/ \  \:\~~\~~\/ \  \:\/:/__\/ \  \:\/:/__\/    ~\~~\::::/]],
			[[   \  \:\/:/    \  \::/ /:/   \  \:\  ~~~   \  \::/       \  \::/          |~~|:|~~ ]],
			[[    \  \::/      \  \:\/:/     \  \:\        \  \:\        \  \:\          |  |:|   ]],
			[[     \__\/        \  \::/       \  \:\        \  \:\        \  \:\         |  |:|   ]],
			[[                   \__\/         \__\/         \__\/         \__\/         |__|/    ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}
		-- local handle = io.popen("fortune")
		-- local fortune = handle:read("*a")
		-- handle:close()
		-- dashboard.section.footer.val = fortune
		--
		-- dashboard.config.opts.noautocmd = true
		--
		-- vim.cmd([[autocmd User AlphaReady echo 'ready']])

		alpha.setup(dashboard.config)
	end,
}
