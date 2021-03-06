/*
 * Author: Glowbal
 * Local callback for checking the blood pressure of a patient
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

private ["_caller","_target","_bloodPressure","_bloodPressureHigh","_bloodPressureLow","_title","_content"];
_caller = _this select 0;
_target = _this select 1;

_bloodPressure = [_target] call FUNC(getBloodPressure);
if (!alive _target) then {
    _bloodPressure = [0,0];
};

_bloodPressureHigh = _bloodPressure select 1;
_bloodPressureLow = _bloodPressure select 0;
_output = "";
_logOutPut = "";
if ([_caller] call FUNC(isMedic)) then {
    _output = "STR_ACE_MEDICAL_CHECK_BLOODPRESSURE_OUTPUT_1";
    _logOutPut = format["%1/%2",round(_bloodPressureHigh),round(_bloodPressureLow)];
} else {
    if (_bloodPressureHigh > 20) then {
        _output = "STR_ACE_MEDICAL_CHECK_BLOODPRESSURE_OUTPUT_2";
        _logOutPut = "Low";
        if (_bloodPressureHigh > 100) then {
            _output = "STR_ACE_MEDICAL_CHECK_BLOODPRESSURE_OUTPUT_3";
            _logOutPut = "Normal";
            if (_bloodPressureHigh > 160) then {
                _output = "STR_ACE_MEDICAL_CHECK_BLOODPRESSURE_OUTPUT_4";
                _logOutPut = "High";
            };

        };
    } else {
        if (random(10) > 3) then {
            _output = "STR_ACE_MEDICAL_CHECK_BLOODPRESSURE_OUTPUT_5";
            _logOutPut = "No Blood Pressure";
        } else {
            _output = "STR_ACE_MEDICAL_CHECK_BLOODPRESSURE_OUTPUT_6";
        };
    };
};

["displayTextStructured", [_caller], [[_output, [_target] call EFUNC(common,getName), round(_bloodPressureHigh),round(_bloodPressureLow)], 1.75, _caller]] call EFUNC(common,targetEvent);

if (_logOutPut != "") then {
    [_target,"activity", "%1 checked Blood Pressure: %2", [[_caller] call EFUNC(common,getName), _logOutPut]] call FUNC(addToLog);
};
