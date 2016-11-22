///game_input();

esc = keyboard_check_pressed(vk_escape);
start = keyboard_check_pressed(vk_enter);
select = keyboard_check_pressed(vk_control);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
right = keyboard_check(vk_right);
left = keyboard_check(vk_left);
fire = keyboard_check_pressed(vk_space);

power_up = keyboard_check(vk_lshift);
power_down = keyboard_check(vk_rshift);

if (esc) {
    game_end();
}
