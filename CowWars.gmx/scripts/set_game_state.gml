/// set_game_state(new_state)
if (instance_exists(GameState)) {
    with (GameState) {
        state_switch(argument0);
    }
}
