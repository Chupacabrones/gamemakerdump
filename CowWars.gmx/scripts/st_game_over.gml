/// st_game_over()
if (state_time == 0) {
    with (obj_cart) {
        state_switch(st_cart_gameover);
    }
}

if (state_time > 5 && Input.start) {
    room_restart();
}
