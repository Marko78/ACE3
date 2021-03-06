/*
 * Author: Glowbal
 * Action for checking the response status of the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller","_target"];
_caller = _this select 0;
_target = _this select 1;

_output = "";
if ([_target] call EFUNC(common,isAwake)) then {
    _output = "STR_ACE_MEDICAL_CHECK_REPONSE_RESPONSIVE";
} else {
    _output = "STR_ACE_MEDICAL_CHECK_REPONSE_UNRESPONSIVE";
};

["displayTextStructured", [_caller], [[_output, [_target] call EFUNC(common,getName)], 2, _caller]] call EFUNC(common,targetEvent);

[_target,"activity",_output, [[_target] call EFUNC(common,getName)]] call FUNC(addToLog);
