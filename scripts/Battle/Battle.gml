// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Battle(Attacker,Defender)
{
	show_debug_message("Battle");
	layer_sequence_create("AssetsBattle",room_width/2,room_height/2,Sequence1);
}