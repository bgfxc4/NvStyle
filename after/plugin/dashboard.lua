local present, db = pcall(require, "dashboard")

if not present then
  return
end

db.setup({
	theme = 'hyper',
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{ desc = ' Update', group = '@property', action = 'PackerUpdate', key = 'u' },
			{
				desc = ' Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				desc = '☭ Programming',
				group = 'DiagnosticHint',
				action = 'Telescope find_files cwd=~/Documents/Programming/',
				key = 'a',
			},
			{
				desc = '⚙ dotfiles',
				group = 'Number',
				action = 'Telescope find_files cwd=~/.config',
				key = 'd',
			},
		},
	},
})
