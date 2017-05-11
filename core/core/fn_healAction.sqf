/*
	fn_healthMonitor
	Author: Sinbane
	Description:
	Drains colour from the screen as health is lowered
*/
private "_handle";
while {alive player} do {
//-----------------------------------

	_handle = ppEffectCreate ["ColorCorrections", 0];
	_handle ppEffectEnable true;
	waitUntil {sleep 1; (damage player) > 0};
	while {(damage player) > 0} do {
		_handle ppEffectAdjust [1, 1, 0, 0, 0, 0, 0, 1, 1, 1, (1-(damage player)), 0.299, 0.587, 0.114, 0];
		_handle ppEffectCommit 0;
		waitUntil {sleep 0.1; ppEffectCommitted _handle};
	};
	_handle ppEffectAdjust [1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0.299, 0.587, 0.114, 0];
};
//-----------------------------------

_handle ppEffectEnable false;
ppEffectDestroy _handle;

//-----------------------------------