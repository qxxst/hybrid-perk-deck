local module = DMod:new("hybrid_perk_deck", {
	abbr = "hybriddeck",
	author = "questmatrix",
	description = "https://github.com/questmatrix/hybrid-perk-deck",
	version = "1.1"
})

module:hook_post_require("lib/units/beings/player/playerdamage", "playerdamage")

module:hook_post_require("lib/tweak_data/upgradestweakdata", "upgradestweakdata")

module:hook_post_require("lib/units/beings/player/states/playerstandard", "playerstandard")

return module
