/// st_turn_transition();
// update the next active cart
if (GameState.active_cart == 1) {
    GameState.active_cart = 2;
} else {
    GameState.active_cart = 1;
}

// update state
if (state_time > 2 * room_speed) {
    with (carts[active_cart]) {
        state_switch(st_cart_start);
    }
    state_switch(st_game_play);
}
