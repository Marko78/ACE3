// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};

//["Soldier", {_player = ACE_player; if (currentWeapon _player in (_player getVariable [QGVAR(safedWeapons), []])) then {[false] call FUNC(setSafeModeVisual)}] call EFUNC(common,addInfoDisplayEventHandler);
//@todo addEventHandler infoDisplayChanged with select 1 == "Soldier"


// Add keybinds
["ACE3", QGVAR(safeMode), localize "STR_ACE_SafeMode_SafeMode",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    // Conditions: specific
    if !([ACE_player] call EFUNC(common,canUseWeapon)) exitWith {false};

    // Statement
    [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call FUNC(lockSafety);
    true
},
{false},
[41, [false, true, false]], false] call cba_fnc_addKeybind;
