///st_cart_action()
var xaxis = (Input.right - Input.left);
var yaxis = (Input.down - Input.up);
var paxis = (Input.power_down - Input.power_up);

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
if (state_time > 5 && Input.fire) {
    var ximp = lengthdir_x(cart_power, theta);
    var yimp = lengthdir_y(cart_power, theta);
    var xx = lengthdir_x(arm_length, theta);
    var yy = lengthdir_y(arm_length, theta);
    
    with(instance_create(phy_position_x + xx, phy_position_y + yy, obj_cow)) {
        image_xscale = other.cart_direction;
        physics_apply_impulse(phy_position_x, phy_position_y, ximp, yimp);
        physics_apply_angular_impulse(2 * other.cart_direction);
    }
    on_end_turn(cart_id);
}

