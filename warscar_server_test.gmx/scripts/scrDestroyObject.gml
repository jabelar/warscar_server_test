// argument0 is the instance id to destroy

// send packet to destroy remote client objects
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, OBJ_DESTROY)
buffer_write(global.tx_buff_server, buffer_u32, argument0)
network_send_packet( global.socket_client, global.tx_buff_server, buffer_tell(global.tx_buff_server) )

with argument0
{
    instance_destroy()
}
