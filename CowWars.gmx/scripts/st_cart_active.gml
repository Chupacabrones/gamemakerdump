///st_cart_action()
var xaxis = (Input.right - Input.left);
var yaxis = (Input.down - Input.up);
var paxis = (Input.power_down - Input.power_up);

// arm control - yaxis

if (cart_direction > 0) {
    // facing left to right
    theta = clamp(theta - yaxis, theta_min, theta_max);
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
    state_switch(st_cart_firing);
}

