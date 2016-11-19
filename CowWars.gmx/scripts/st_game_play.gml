/// st_game_play()

// init carts
if (state_time = 0 && room == rm_game) {
    with(obj_cart) {
        GameState.carts[cart_id] = self;
        //show_message(string(cart_id));
        if (cart_id == GameState.active_cart) {
            state_switch(st_cart_active);
        } else {
            state_switch(st_cart_inactive);
        }
    }
}

// when cart completes action, switch active cart
