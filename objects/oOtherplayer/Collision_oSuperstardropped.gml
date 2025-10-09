var dieCheck = sprite_get_name(spr);

if string_pos("die", dieCheck) == 0 {instance_destroy(other);}