/// launch_cow(x, y, power, direction, angle)
var pp = argument2;
var dir = argument3;
var angle = argument4; 
var ximp = lengthdir_x(pp, angle);
var yimp = lengthdir_y(pp, angle);
var xx = argument0 + lengthdir_x(arm_length, angle);
var yy = argument1 + lengthdir_y(arm_length, angle);

with(instance_create(xx, yy, obj_cow)) {
    image_xscale = dir;
    physics_apply_impulse(phy_position_x, phy_position_y, ximp, yimp);
    physics_apply_angular_impulse(2 * dir);
}
audio_play_sound(snd_gunsplode, 10, 0);
audio_play_sound(snd_cow, 10, 0);
