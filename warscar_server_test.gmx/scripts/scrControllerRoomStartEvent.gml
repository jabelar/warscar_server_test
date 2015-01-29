if room == room0
{
    obj_instances_number[OBSTACLE] = 0
    obj_instances_number[FLAG] = 0
    
    // populate obstacles
    randomize()
    var i
    for (i=0; i<10; i+=1)
    {
        x = irandom(room_width)
        y = irandom(room_height)
        new_instance = instance_create(x, y, objObstacle)
        with new_instance
        {
            while not place_free(other.x, other.y)
            other.x = irandom(room_width)
            other.y = irandom(room_height)
        }
        // send packet to create obstacle on remote client
        scrSendCreateObject(OBSTACLE, new_instance)
    }
}
