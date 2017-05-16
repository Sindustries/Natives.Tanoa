/*
	fn_warbotInit
	Author: Sinbane
	Readies the Dynamic War system
*/
private [];

#include "cfgCompositions.sqf";
#include "cfgRequest.sqf";

NATmilitaryCamps = [];
NATmilitiaCamps = [];
NATnativeCamps = [];
NATcivilianCamps = [];

NATresFood = 8;
NATresWater = 8;
NATresScrap = 50;

NATmilitaryForce = [];
NATmilitiaForce = [];
NATnativeForce = [];

//-----------------------------------