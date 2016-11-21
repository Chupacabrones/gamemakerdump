/// generate_mountain()
randomize();

// base width and height
var sprite_size = 32;
var base_width = (view_wview[0] / 2) + (irandom(5) * choose(-sprite_size, sprite_size));
var base_height = base_width * 1.5;

var rows = floor(base_height / sprite_size);
var cols = floor(base_width / sprite_size);
var base_x = (view_wview[0] / 2) - ((cols * sprite_size) / 2);
var base_y = view_yview[0] + (view_hview[0] - (sprite_size * 2));

// start at bottom (max y) and go up (decrement y)
// algorithm: randomly decrease width
var missing_left_cols = 0;
var missing_right_cols = cols;
var missing_inner_cols = 0;

for (var r = 0; r < rows; r ++) {
    for (var c = 0; c < cols; c ++) {
        var xx = base_x + (c * sprite_size);
        var yy = base_y - (r * sprite_size);
        var no_outside_missing = c >= missing_left_cols && c < missing_right_cols;
        var is_inside_missing = r > (rows - 10) && (c <= (missing_left_cols + missing_inner_cols) && c >= (missing_right_cols - missing_inner_cols));
        if (no_outside_missing && !is_inside_missing) {
            instance_create(xx, yy, obj_dirt);
        }
    }
    if (irandom(3) == 1) {
        missing_left_cols ++;
    }
    if (irandom(3) == 1) {
        missing_right_cols --;
    }
    if (r > (rows - 10)) {
        missing_inner_cols ++;
    }
}
