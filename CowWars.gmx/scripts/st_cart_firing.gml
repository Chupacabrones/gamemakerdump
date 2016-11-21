/// st_cart_firing()

if (state_time == 0) {
    instance_create(x, y, Meter);
}

if (!instance_exists(Meter)) {
    state_switch(st_cart_active);
}

// LAUNCH!
if (Input.fire && instance_exists(Meter)) {
    var power_percent = 0;
    with (Meter) {
        power_percent = Meter.meter_progress / 100;
        instance_destroy();
    }

    launch_cow(phy_position_x, phy_position_y, (cart_power * power_percent), cart_direction, theta);
    state_switch(st_cart_end); // end turn.
}
