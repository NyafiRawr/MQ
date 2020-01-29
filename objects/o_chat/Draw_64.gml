draw_set_halign(fa_left);
color_mf0 c_white color_mf1;
draw_self();

var msgCut = textfield_string;
var maxWi = 246;

if string_width(msgCut) > maxWi {
	var len = 0;
	for(var a = string_length(msgCut); a > 0; a--){
		len += string_width(string_char_at(msgCut, a));
		if len > maxWi {
			msgCut = string_delete(msgCut, 1, a);
			break;
		}
	}
}

if string_length(msgCut) > 0 || textfield_active{
    draw_text(x+5, y+9, msgCut);
} else {
    draw_text(x+5, y+9, "Написать в чат");
}
if textfield_active {
    draw_text_color(x+5+string_width(msgCut), y+9, "|", c_white, c_white, c_white, c_white, round(abs(sin(get_timer()/500000))));
}
draw_set_halign(fa_center);
