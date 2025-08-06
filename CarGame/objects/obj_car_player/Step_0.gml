// Aceleração
if (keyboard_check(vk_up)) {
    speed = clamp(speed + acceleration, -max_speed, max_speed);
} else if (keyboard_check(vk_down)) {
    speed = clamp(speed - acceleration, -max_speed/2, max_speed);
} else {
    // Freio automático (fricção)
    if (abs(speed) > friction) {
        speed -= sign(speed) * friction;
    } else {
        speed = 0;
    }
}

// Gira o carro
if (keyboard_check(vk_left)) {
    direction += turn_speed * (speed / max_speed);
}
if (keyboard_check(vk_right)) {
    direction -= turn_speed * (speed / max_speed);
}

// Atirar com Z
if (keyboard_check_pressed(ord("Z"))) {
    var offset = 0; // metade da largura do sprite

    var bullet_x = x + lengthdir_x(offset, direction);
    var bullet_y = y + lengthdir_y(offset, direction);
    
    var bullet = instance_create_layer(bullet_x, bullet_y, "Instances", obj_bullet);
    
    // Define para o tiro a direção atual do carro
    bullet.direction = direction;
}


// Movimento
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

image_angle = direction;
