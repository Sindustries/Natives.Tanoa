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
	_handle ppEffectAdjust [1, 1, 0, 0, 0, 0, 0, 1, 1, 1, (1-(damage player)), 0.299, 0.587, 0.114, 0];
	_handle ppEffectCommit 1;
	waitUntil {sleep 1; ppEffectCommitted _handle};

};
//-----------------------------------

_handle ppEffectEnable false;
ppEffectDestroy _handle;

//-----------------------------------