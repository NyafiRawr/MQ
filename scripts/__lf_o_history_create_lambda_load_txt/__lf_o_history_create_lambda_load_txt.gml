/// __lf_o_history_create_lambda_load_txt()
//!#lambda lambda_load_txt
{
    var file = get_open_filename("*.txt|*.txt", "");
    if (file != "") {
        file = file_text_open_read(file);
        if (file != -1) {
            var roundName = ""; 
            var roundPic  = ""; 
            var roundLink = "";
            var roundTime = "";
            var line;
            var lineN = 0;
            var parseStrings = false;
            var arr_stroka;
            
            while (!file_text_eof(file)) {
                line = file_text_read_string( file);
                if (string_length(line) != 0) {
                    parseStrings = true;
                } 
                
                if (parseStrings) {
                    lineN++;
                    switch( lineN){
                        case 1: 
                            roundName = line; 
                            break;
                        case 2: 
                            roundPic = line; 
                            break;
                        case 3: 
                            roundLink = line; 
                            break;
                        case 4:
							roundTime = line;

							arr_stroka = array_height_2d(game_arr);
                            game_arr[arr_stroka, EData.name]     = roundName;
                            game_arr[arr_stroka, EData.pic]      = roundPic;
                            game_arr[arr_stroka, EData.songLink] = roundLink;
                            game_arr[arr_stroka, EData.start]	 = real(string_copy(roundTime, 1, string_pos("(", roundTime)-1));
                            game_arr[arr_stroka, EData.len] 	 = real(string_copy(roundTime, string_pos("(", roundTime)+1, string_pos(")", roundTime)-1));
                            
                            roundName = ""; 
                            roundPic = ""; 
                            roundLink = "";
                            roundTime = "";
                            lineN = 0;
                            parseStrings = false;

							break;
                    }
                }
                file_text_readln(file);
            }
            
            o_control.roundTotal = arr_stroka;
            
            file_text_close(file);
        }
    }
}