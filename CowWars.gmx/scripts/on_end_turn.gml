/// on_end_turn(cart_id)
if (argument0 == 1) {
    GameState.active_cart = 2;
} else {
    GameState.active_cart = 1;
}

// new cart
with(GameState.carts[GameState.active_cart]) {
    state_switch(st_cart_active);
}
state_switch(st_cart_inactive);
