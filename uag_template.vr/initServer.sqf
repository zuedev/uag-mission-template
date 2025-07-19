/* initServer.sqf
 *
 * Executed only on server when mission is started.
 *
 * More info: https://community.bistudio.com/wiki/Event_Scripts#initServer.sqf
 */

// spawn arsenal at respawn marker logic
[getPosASL respawn_logic] spawn uag_fnc_createArsenal;

// set in-game date to match server's system date but keep the game hour and minute
private _systemDateTime = systemTimeUTC;
private _systemYear = _systemDateTime select 0;
private _systemMonth = _systemDateTime select 1;
private _systemDay = _systemDateTime select 2;

private _gameDate = date;
private _gameHour = _gameDate select 3;
private _gameMinute = _gameDate select 4;

setDate [_systemYear, _systemMonth, _systemDay, _gameHour, _gameMinute];