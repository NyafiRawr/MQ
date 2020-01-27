audio_play_sound(a_but_host, 10, false);

var sendbuf = buffer_create( 8, buffer_grow, 1);
buffer_write(sendbuf, buffer_u8, ESong.play);
buffer_write(sendbuf, buffer_u8, o_control.roundTime);
o_control.countdown = o_control.roundTime;
sendAll(sendbuf);

global.gameState = ESong.play;

instance_activate_object(o_host_hint);
instance_activate_object(o_host_answer);
instance_deactivate_object(self);

if (o_control.songFile != -1) {
    o_control.mediaPlayer = playMusic(o_control.songFile);
}