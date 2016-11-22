/// apply_weather()


// rain 
//effect_create_above(ef_rain, 0, 0, 1, c_gray);

// wind
randomize();

if (irandom(30 * room_speed) == 1) { //every thirty-seconds-ish 
    global.wind_angle = choose(180, 0);
    global.wind_power = random(100);
}
