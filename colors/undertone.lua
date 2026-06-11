-- Reload theme modules so `:colorscheme undertone` picks up local edits.
package.loaded['undertone.palette'] = nil
package.loaded['undertone.groups'] = nil

-- Loads the variant from setup(), 'default' unless configured.
require('undertone').load()
