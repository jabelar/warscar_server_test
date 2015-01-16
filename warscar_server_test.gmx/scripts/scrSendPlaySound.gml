// argument0 is sound type constant
// argument1 is sound x position
// argument2 is sound y position

buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, SOUND_PLAY)
buffer_write(global.tx_buff_server, buffer_u32, argument0)
buffer_write(global.tx_buff_server, buffer_u32, argument1)
network_send_packet( global.socket_client, global.tx_buff_server, buffer_tell(global.tx_buff_server) )

