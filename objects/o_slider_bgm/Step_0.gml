
if activ {
	global.gain_bgm = (mouse_x - xp) / leng;
	global.gain_bgm = clamp(global.gain_bgm, 0, 1);
	audio_sound_gain(global.bgm, global.gain_bgm, 0);
	
	if mouse_check_button_released(mb_left) {
		activ = false;
		ini_open("sound.conf");
		ini_write_real("game", "gain_bgm", global.gain_bgm);
		ini_close();
	}
}