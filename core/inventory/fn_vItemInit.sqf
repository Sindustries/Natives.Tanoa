/*
	fn_vItemInit
	Author: Sinbane
	Classifies vItems for use
*/

NATvInvItems = ["vInvItems"] call NAT_fnc_getSetting;
NATvInvItemsOnly = [];
//GET NAMES & ICONS
for "_i" from 0 to (count (NATvInvItems)-1) do {
	private ["_name","_item","_icon"];
	_item = (NATvInvItems select _i);
	if (_item isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]) then {
		_icon = getText (configFile >> "CfgMagazines" >> _item >> "picture");
		_name = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
	} else {
		_icon = getText (configFile >> "CfgWeapons" >> _item >> "picture");
		_name = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
	};
	NATvInvItems set [_i,[_name,_item,_icon]];
	NATvInvItemsOnly pushBackUnique _item;
};

//-----------------------------------
//-ITEM LISTS
NATvInvMedicalItems = [
"sc_elasticbandage","sc_morphine","sc_epinephrine","sc_disinfectant","sc_penicillin","sc_potassium","sc_blood","sc_ibuprofen","zk_antibiotic","zk_bandage","FirstAidKit","Medikit","zk_painKillers","sc_tourniquet"
];

NATvInvFoodItems = [
"sc_cannedfood","sc_chips","sc_cookedmeat","sc_mre","sc_rawmeat","sc_charms","sc_carrot","sc_cereal","sc_corn","sc_human_flesh","sc_potato","sc_salisbury_steak","sc_snack_cakes","sc_donut","sc_snoballs","sc_twinkies","ACE_Banana","sc_candybar","zk_cannedfood","zk_powderedmilk","zk_ricebox","zk_tacticalBacon"
];

NATvInvDrinkItems = [
"sc_juicebox","sc_whiskey","sc_beer","sc_coffee","sc_dirty_water","sc_energy_drink","sc_moonshine","zk_soda2","zk_f_canteen","zk_soda1","zk_waterbottle"
];

NATvInvCampItems = [
"zk_tent","sc_bedroll","zk_wood"
];

//-----------------------------------