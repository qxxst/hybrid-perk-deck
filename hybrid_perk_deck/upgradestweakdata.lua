local module = ... or D:module('hybrid_perk_deck')
local UpgradesTweakData = module:hook_class("UpgradesTweakData")

module:post_hook(UpgradesTweakData, "_player_definitions", function(self)
	self.values.player.__pd2_muscle_more_hp = 1.5 -- HP multiplier (originally 1; 1.8 with previous mods)
	self.values.player.__pd2_muscle_regen_hp = 0.006 -- HP regeneration per interval (originally 0; 0.03 with previous mods)
	self.values.player.__pd2_muscle_regen_hp_dt = 1 -- HP regeneration interval in seconds (originally 0; 5 with previous mods)
	self.values.player.__pd2_muscle_panic_suppression_rate = 0.002 -- Panic suppression probability (originally 0; 0.35 with previous mods)
	self.values.player.__pd2_muscle_panic_suppression_dis = 750 -- Panic suppression distance (originally 0; 1500 with previous mods)
    self.values.player.rogue_dodge_chance = 0.15 -- Dodge probability (originally 0; 0.6 with previous mods)
	self.values.player.rogue_fast_hand = 3.0 -- Swap speed multiplier (originally 1; 1.8 with previous mods)
	self.values.player.toolset[1] = 0.825
	self.values.player.toolset[2] = 0.75
	self.values.player.toolset[3] = 0.625
	self.values.player.toolset[4] = 0.5
end, true)