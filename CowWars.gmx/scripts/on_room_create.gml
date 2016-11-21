/// on_room_create();


// set global weather
globalvar wind_angle;
globalvar wind_power;
global.wind_angle = 0;
global.wind_power = 0;

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


// generate mountain
generate_mountain();
