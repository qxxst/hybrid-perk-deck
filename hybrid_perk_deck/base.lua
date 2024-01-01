local module = DMod:new("hybrid_perk_deck", {
	abbr = "hybriddeck",
	author = "qxxst",
	description = "https://github.com/qxxst/hybrid-perk-deck",
	version = "1.0"
})

module:hook_post_require("lib/units/beings/player/playerdamage", "playerdamage")

module:hook_post_require("lib/tweak_data/upgradestweakdata", "upgradestweakdata")

module:hook_post_require("lib/units/beings/player/states/playerstandard", "playerstandard")

return module
