// argument0 is player constant
if key_down[argument0]
{
    with player_object[argument0]
    {
        if not instance_place(other.player_x[argument0], other.player_y[argument0]+8, objObstacle) then other.player_y[argument0] += 8
    }
}
if key_up[argument0]
{
    with player_object[argument0]
    {
        if not instance_place(other.player_x[argument0], other.player_y[argument0]-8, objObstacle) then other.player_y[argument0] -= 8
    }
}
if key_right[argument0]
{
    with player_object[argument0]
    {
        if not instance_place(other.player_x[argument0]+8, other.player_y[argument0], objObstacle) then other.player_x[argument0] += 8
    }
}
if key_left[argument0]
{
    with player_object[argument0]
    {
        if not instance_place(other.player_x[argument0]-8, other.player_y[argument0], objObstacle) then other.player_x[argument0] -= 8
    }
}
     
if player_x[argument0] < 0 then player_x[argument0] = room0.room_width
if player_x[argument0] > room0.room_width then player_x[argument0] = 0
if player_y[argument0] < 0 then player_y[argument0] = room0.room_height
if player_y[argument0] > room0.room_height then player_y[argument0] = 0

if key_weapon[argument0]
{
    new_instance = instance_create(player_object[argument0].x, player_object[argument0].y, objBullet)
    new_instance.speed = 32
    new_instance.direction = 0 // irandom(360)
    scrSendCreateObject(BULLET, new_instance)
}
