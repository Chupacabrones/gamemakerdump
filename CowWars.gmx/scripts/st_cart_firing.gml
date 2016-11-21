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

    var ximp = lengthdir_x(cart_power * power_percent, theta);
    var yimp = lengthdir_y(cart_power * power_percent, theta);
    var xx = lengthdir_x(arm_length, theta);
    var yy = lengthdir_y(arm_length, theta);
    
    with(instance_create(phy_position_x + xx, phy_position_y + yy, obj_cow)) {
        image_xscale = other.cart_direction;
        physics_apply_impulse(phy_position_x, phy_position_y, ximp, yimp);
        physics_apply_angular_impulse(2 * other.cart_direction);
    }
    audio_play_sound(snd_gunsplode, 10, 0);
    audio_play_sound(snd_cow, 10, 0);
    state_switch(st_cart_end); // end turn.
}
