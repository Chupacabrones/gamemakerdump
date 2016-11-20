/// st_cart_start()


//begin turn after 2 seconds
if (state_time > 2 * room_speed) {
    state_switch(st_cart_active);
}
