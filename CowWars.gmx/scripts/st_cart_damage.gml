/// st_cart_damage()

if (state_time == 0) {
    cart_health = clamp(cart_health - 10, 0, 100);
    
    if (cart_health == 0) {
        set_game_state(st_game_over);
    }
}

if (state_time > 1 * room_speed) {
    state_switch(state_last);
}

