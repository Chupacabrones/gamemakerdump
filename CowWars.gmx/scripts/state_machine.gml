#define state_machine
/// state_scripts() N/A
/***


*/







#define state_init
/// state_init(state);
state = argument0;
state_time = 0;
state_changed = false;
state_last = noone;

#define state_switch
/// state_switch(state);
state_last = state;
state = argument0;
state_time = 0;
state_changed = true;


#define state_process
/// state_process();
script_execute(state);

if (!state_changed) state_time ++;
state_changed = false;