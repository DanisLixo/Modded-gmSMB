rope = instance_create_depth(x+sprite_width/2,limit,depth,oRope);
op = instance_create_depth(rx,ry,depth,oSeesaw_other);

with (op) {
    op = other.id;
    limit = other.limit;
    sprite_index = other.sprite_index;
}