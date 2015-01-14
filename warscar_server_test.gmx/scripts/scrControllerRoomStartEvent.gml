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
        // keep track of instances
        obj_instances[OBSTACLE, i] = new_instance
        // send packet to create obstacle on remote client
        buffer_seek(tx_buff_server, buffer_seek_start, 0)
        buffer_write(tx_buff_server, buffer_u8, OBJ_CREATE)
        buffer_write(tx_buff_server, buffer_u8, OBSTACLE)
        buffer_write(tx_buff_server, buffer_s32, new_instance.x)
        buffer_write(tx_buff_server, buffer_s32, new_instance.y)
        network_send_packet( global.socket_client, tx_buff_server, buffer_tell(tx_buff_server) )
        show_debug_message("Sending packet to create obstacle")
    }
}
