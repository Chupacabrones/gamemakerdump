/// on_room_create();


// update the gamestate carts array
with(obj_cart) {
    GameState.carts[cart_id] = self;
    //show_message(string(cart_id));
    if (cart_id == GameState.active_cart) {
        state_switch(st_cart_start);
    } else {
        state_switch(st_cart_inactive);
    }
}

// generate clouds
for (var i = 0; i < irandom(20); i++) {
    instance_create(x, y, obj_cloud);
}
