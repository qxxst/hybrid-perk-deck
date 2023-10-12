# Hybrid Perk Deck
A mod that provides a variety of buffs for *PAYDAY: The Heist*.

This mod combines and adjusts the effects of the other Perk Deck mods originally made by [Dr_Newbie](https://modworkshop.net/user/dr_newbie) and submitted to modworkshop.net. No copyright infringement is intended.
## Effects
When using this mod:
### [Muscle](https://modworkshop.net/mod/27990)
- You will have 50% extra base health.
- You will passively regenerate 0.6% of your health every second.
- Each shot from your firearms has a 0.1% chance of intimidating nearby enemies, forcing them to surrender.
  - You can then yell at them to cuff themselves like normal.
### [Rogue](https://modworkshop.net/mod/26078)
- You have a 15% chance to ignore ("dodge") incoming damage.
- You swap between firearms 200% faster.
### [Grinder](https://modworkshop.net/mod/26072)
TBD
### [Armorer](https://modworkshop.net/mod/26195)
TBD

You can change these numbers to be whatever you want by editing the variables in **upgradestweakdata.lua**. For context, I have also added comments next to each variable that briefly explain what it does and what its previous values were, both in the vanilla game and with the original mods, such as `HP regeneration per interval (originally 0; 0.03 with previous mods)`.
## Installation
1. Install [DorHUD](https://modworkshop.net/mod/14267).
2. Download the latest version of the mod from the [releases](https://github.com/questmatrix/hybrid-perk-deck/releases) page.
3. Extract the zipped folder and move the **hybrid_perk_deck** folder to your PAYDAY The Heist\mods folder.
4. Make sure the module is enabled in your mod manager settings.
## Design
The issue with the original versions of these mods is that they used the exact same numbers from the *PAYDAY 2* Perk Decks without proper adjustments, resulting in them being disproportionately stronger and often trivializing gameplay in PD:TH.
### Muscle
Previously, the Muscle Perk Deck gave each individual shot from firearms a 35% chance to make nearby enemies surrender. Both other users of the mod and myself found this rate to be absurdly high - especially with automatic weapons and/or weapons with a high rate of fire - so I reduced it to 0.1%. I also lowered its effective range.

Muscle also gives an 80% boost to base HP, and regenerates 3% of it every 5 seconds. After taking into account survivability buffs from the other Perk Decks, I reduced the HP boost to 50% and updated the regeneration to be per-second instead of every 5 seconds (although the effective rate of regeneration is still the same).

The goal of these changes, and my previous fork of the Muscle Perk Deck mod, is to allow for a passive health regeneration mechanic, as well as easier accumulation of new hostages via the random surrender mechanic, without completely trivializing gameplay as the original mod did.

In the future, I would like to give different weapons different rates of intimidation. The lowered probability prevents automatic firearms from being overpowered, but also means that non-automatic firearms are extremely unlikely to trigger the effect. I also would like to prevent the Perk Deck from being able to intimidate special units like Bulldozers and Tasers.
