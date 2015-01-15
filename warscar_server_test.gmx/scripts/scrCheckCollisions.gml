with objBullet
{
    // show_debug_message("Checking objBullet for collisions")
    collision_id = collision_line(x, y, x+speed, y, objObstacle, true, true);
    if collision_id > 0
    {
        show_debug_message("Bullet collision")
        effect_create_above(ef_explosion, x, y, 2, c_gray)
        scrSendCreateEffect(ef_explosion, x, y, 2, c_gray)
        scrDestroyObject(collision_id)
        scrDestroyObject(self.id)
    }
}
