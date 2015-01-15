// argument0 is object_type constant
// argument1 is instance id of local object
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, OBJ_CREATE)
buffer_write(global.tx_buff_server, buffer_u8, argument0)
buffer_write(global.tx_buff_server, buffer_u32, argument1)
buffer_write(global.tx_buff_server, buffer_s32, argument1.x)
buffer_write(global.tx_buff_server, buffer_s32, argument1.y)
buffer_write(global.tx_buff_server, buffer_s32, argument1.speed)
buffer_write(global.tx_buff_server, buffer_s32, argument1.direction)
network_send_packet( global.socket_client, global.tx_buff_server, buffer_tell(global.tx_buff_server) )
show_debug_message("Sending packet to create instance "+string(argument1)+" of object type = "+string(argument0))

// keep track of instances
ds_map_add(global.object_map, argument1, argument0)

