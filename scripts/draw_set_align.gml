///draw_set_align(h,v);


switch(argument[0]){
    case -1: 
        draw_set_halign(fa_left);
        break;
    case 0:
        draw_set_halign(fa_center);
        break;
    case 1:
        draw_set_halign(fa_right);
        break;
}


switch(argument[0]){
    case -1: 
        draw_set_valign(fa_top);
        break;
    case 0:
        draw_set_valign(fa_middle);
        break;
    case 1:
        draw_set_valign(fa_bottom);
        break;
}
