///st_cart_action()
var xaxis = (input_right - input_left);
var yaxis = (input_down - input_up);
var paxis = (input_power_down - input_power_up);

// arm control - yaxis

if (cart_direction > 0) {
    // facing left to right
    theta = clamp(theta + yaxis, theta_min, theta_max);
} else {
    // facing right to left
    theta = clamp(theta + yaxis, theta_min + 90, theta_max + 90);
}
// cart control - xaxis
phy_position_x += xaxis * cart_speed;

// power up/down
cart_power = clamp(cart_power + paxis * cart_power_speed, cart_power_min, cart_power_max); 

// projectile launch
if (input_fire) {
    var ximp = lengthdir_x(cart_power, theta);
    var yimp = lengthdir_y(cart_power, theta);
    var xx = lengthdir_x(arm_length, theta);
    var yy = lengthdir_y(arm_length, theta);
    
    with(instance_create(x + xx, y + yy, obj_cow)) {
        physics_apply_impulse(x, y, ximp, yimp);
    }
}

// movement
