/// st_cart_firing()
var is_launched = false;
var power_percent = 0;

if (state_time == 0) {
    instance_create(x, y, Meter);
}

// if the meter ran out out, give the user a 1% launch
if (!instance_exists(Meter)) {
    is_launched = true;
    power_percent = 0.1;
}

// read the meter and get ready to launch
if (Input.fire_released && instance_exists(Meter)) {
    is_launched = true;
    with (Meter) {
        power_percent = Meter.meter_progress / 100;
        instance_destroy();
    }
}


if (is_launched) {
    launch_cow(phy_position_x, phy_position_y, (cart_power * power_percent), cart_direction, theta);
    state_switch(st_cart_end); // end turn.
}
