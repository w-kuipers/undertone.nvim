-- Reload theme modules so `:colorscheme undertone` picks up local edits.
package.loaded['undertone.palette'] = nil
package.loaded['undertone.groups'] = nil

require('undertone').load()
