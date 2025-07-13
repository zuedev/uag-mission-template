/* onPlayerKilled.sqf
 *
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * More info: https://community.bistudio.com/wiki/Event_Scripts#onPlayerKilled.sqf
 */
 
params ["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

// if initial spawn, do nothing
if (isNil "UAG_initialSpawn") exitWith {
	UAG_initialSpawn = true;
	setPlayerRespawnTime 1;
};

setPlayerRespawnTime _respawnDelay;

// if respawn is type 3 (or "BASE"), tell the player they will respawn in _respawnDelay seconds
_respawnIn = format [localize "You will respawn in %1 seconds...", _respawnDelay];

[[
	["You have died.", "<t align = 'center' color='#ff0000'>%1</t><br/>"],
	[_respawnIn, "<t align = 'center'>%1</t>", 60]
]] spawn BIS_fnc_typeText;
