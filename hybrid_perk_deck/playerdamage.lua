local module = ... or D:module('hybrid_perk_deck')
local PlayerDamage = module:hook_class("PlayerDamage")

function PlayerDamage:_upd_health_regen_muscle_deck(t, dt)
	if not self:full_health() then
		if self.__muscle_regen_hp_dt then
			self.__muscle_regen_hp_dt = self.__muscle_regen_hp_dt - dt
			if self.__muscle_regen_hp_dt < 0 then
				self.__muscle_regen_hp_dt = nil
			end
		else
			self.__muscle_regen_hp_dt = tweak_data.upgrades.values.player.__pd2_muscle_regen_hp_dt
			local regen_rate = tweak_data.upgrades.values.player.__pd2_muscle_regen_hp
			self._health = self._health + regen_rate * self:_max_health()
			self:_send_set_health()
			managers.hud:set_player_health({
				current = self._health,
				total = self:_max_health()
			})		
		end
	elseif self.__muscle_regen_hp_dt then
		self.__muscle_regen_hp_dt = nil
	end	
end

local __old_max_health = PlayerDamage._max_health

function PlayerDamage:_max_health(...)
	return __old_max_health(self, ...) * tweak_data.upgrades.values.player.__pd2_muscle_more_hp
end

module:post_hook(PlayerDamage, "init", function(self)
	self._rogue_dodge_chance = tweak_data.upgrades.values.player.rogue_dodge_chance
	if not self._armorer_deck_addon_armor and tweak_data.upgrades.values.player.armorer_deck_addon_armor then
		self._armorer_deck_bool = true
		self._armorer_deck_addon_armor =  tweak_data.upgrades.values.player.armorer_deck_addon_armor * self:_max_armor()
		self._armorer_deck_inmune_during =  tweak_data.upgrades.values.player.armorer_deck_inmune_during
		self._armorer_deck_inmune_cooldown =  tweak_data.upgrades.values.player.armorer_deck_inmune_cooldown
		self._armorer_deck_inmune_run =  0
		self._armorer_deck_inmune_run_dt =  0
		self:replenish()
	end
end, true)

local old_max_armor = "F_"..Idstring("PlayerDamage:_max_armor:pd2_armorer_deck"):key()

PlayerDamage[old_max_armor] = PlayerDamage[old_max_armor] or PlayerDamage._max_armor

function PlayerDamage:_max_armor(...)
	if self._armorer_deck_bool then
		return self[old_max_armor](self, ...) + (self._armorer_deck_addon_armor or 0)
	else
		return self[old_max_armor](self, ...)
	end
end

local old_chk_dmg_too_soon = "F_"..Idstring("PlayerDamage:_chk_dmg_too_soon:pd2_armorer_deck"):key()

PlayerDamage[old_chk_dmg_too_soon] = PlayerDamage[old_chk_dmg_too_soon] or PlayerDamage._chk_dmg_too_soon

function PlayerDamage:_chk_dmg_too_soon(...)
	if self._armorer_deck_bool and self._armorer_deck_inmune_run == 1 and self._armorer_deck_inmune_run_dt then
		return true
	end
	return self[old_chk_dmg_too_soon](self, ...)
end

function PlayerDamage:_update_armorer_break_event(t, dt)
	if self._armorer_deck_bool then
		if self._armor <= 0 and self._armorer_deck_inmune_run == 0 then
			self._armorer_deck_inmune_run = 1
			self._armorer_deck_inmune_run_dt = self._armorer_deck_inmune_during
		end
		if self._armorer_deck_inmune_run == 1 and self._armorer_deck_inmune_run_dt then
			self._armorer_deck_inmune_run_dt = self._armorer_deck_inmune_run_dt - dt
			if self._armorer_deck_inmune_run_dt < 0 then
				self._armorer_deck_inmune_run = 2
				self._armorer_deck_inmune_run_dt = nil
			end
		end
		if self._armorer_deck_inmune_run == 2 then
			self._armorer_deck_inmune_run = 3
			self._armorer_deck_inmune_run_dt = self._armorer_deck_inmune_cooldown
		end
		if self._armorer_deck_inmune_run == 3 then
			self._armorer_deck_inmune_run_dt = self._armorer_deck_inmune_run_dt - dt
			if self._armorer_deck_inmune_run_dt < 0 then
				self._armorer_deck_inmune_run = 0
				self._armorer_deck_inmune_run_dt = nil
			end
		end
	end
end

local old_damage_bullet = PlayerDamage.damage_bullet

function PlayerDamage:damage_bullet(...)
	if math.random() <= self._rogue_dodge_chance then
		return	
	end
	return old_damage_bullet(self, ...)
end