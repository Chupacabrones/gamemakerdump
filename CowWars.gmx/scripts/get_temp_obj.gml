///script_call_with()
// goal: call this script and get the instance vars from it.
// create a new temp obj and set its instance vars
var inst = instance_create(0, 0, obj_temp);
with (inst) {
    // do some actual work and within the scope of the temp obj
    temp_var1 = irandom(10);
    temp_var2 = irandom(10);
}

// return the temp object containing our vars.
return inst;
