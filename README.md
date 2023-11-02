# Hybrid Perk Deck
A mod that provides multiple buffs for *PAYDAY: The Heist*.

This mod combines and adjusts the effects of the other Perk Deck mods originally made by [Dr_Newbie](https://modworkshop.net/user/dr_newbie) and submitted to modworkshop.net. No copyright infringement is intended.
## Disclaimer
**THIS MOD IS A CHEAT.** It makes the game easier. Don't use it in public servers.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
## Effects
When using this mod:
### [Muscle](https://modworkshop.net/mod/27990)
- You will have 50% extra base health.
- You will passively regenerate 0.6% of your health every second.
- Each shot from your firearms has a 0.2% chance of intimidating nearby enemies, forcing them to surrender.
  - You can then yell at them to cuff themselves like normal.
### [Rogue](https://modworkshop.net/mod/26078)
- You have a 15% chance to ignore ("dodge") incoming damage.
- You swap between firearms 200% faster.
### Equipment
- The Toolkit now provides significantly higher bonuses to interaction speed (12.5% to 50% based on its upgrade level). This does not apply when using other equipment.

You can change these numbers to be whatever you want by editing the variables in `upgradestweakdata.lua`. For context, I have also added comments next to each variable that briefly explain what it does and what its previous values were, both in the vanilla game and with the previous versions of the mods (when applicable).
## Installation
1. Install [DorHUD](https://modworkshop.net/mod/14267).
2. Download the latest version of the mod from the [releases](https://github.com/questmatrix/hybrid-perk-deck/releases) page.
3. Extract the zipped folder and move the `hybrid_perk_deck` folder to your PAYDAY The Heist\mods folder.
4. Make sure the module is enabled in your mod manager settings.
5. After enabling the module, restart your game for the change to take effect.
## Design
The issue with the original versions of the Perk Deck mods is that they used the exact same numbers from the *PAYDAY 2* Perk Decks without proper adjustments, resulting in them being disproportionately stronger and often trivializing gameplay in PD:TH.
### Muscle
Previously, the Muscle perk deck gave each individual shot from firearms a 35% chance to make nearby enemies surrender. Both other users of the mod and myself found this rate to be absurdly high - especially with automatic weapons and/or weapons with a high rate of fire - so I reduced it to 0.2%. I also lowered its effective range.

Muscle also gives an 80% boost to base HP, and regenerates 3% of it every 5 seconds. After taking into account survivability buffs from the other Perk Decks, I reduced the HP boost to 50% and updated the regeneration to be per-second instead of every 5 seconds (although the effective rate of regeneration is still the same).

The goal of these changes, and my previous fork of the Muscle Perk Deck mod, is to allow for a passive health regeneration mechanic, as well as easier accumulation of new hostages via the random surrender mechanic, without completely trivializing gameplay as the original mod did.

In the future, I would like to give different weapons different rates of intimidation. The lowered probability prevents automatic firearms from being overpowered, but also means that non-automatic firearms are extremely unlikely to trigger the effect. I also would like to prevent the Perk Deck from being able to intimidate special units like Bulldozers and Tasers, although this is also indirectly less likely to happen now since the overall rate was reduced.
### Rogue
The Rogue perk deck previously gave a 60% chance to ignore incoming damage. I reduced this to 15%.

I actually *increased* the weapon swap speed, which is now 3x its original rate in the vanilla game. The previous version of the mod had this set to 1.8. I don't have a specific rationale for increasing this further other than it's fun and I like being able to swap between firearms quickly.
### Armorer
I was interested in modifying the Armorer perk deck's invincibility period after your armor is broken, with the goal of using it as a mechanic to get out of tight situations. Unfortunately, I was unable to add it to this mod without the game crashing upon startup. This was also an issue with the original version of the mod.

I may give it another shot in the future, but right now I'm not sure how to fix whatever's wrong with it.
### Equipment
TBD
