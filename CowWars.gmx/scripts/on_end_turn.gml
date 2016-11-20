/// on_end_turn(cart_id)
state_switch(st_cart_inactive);

// update the next active cart
if (argument0 == 1) {
    GameState.active_cart = 2;
} else {
    GameState.active_cart = 1;
}

set_game_state(st_turn_transition);
