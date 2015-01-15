// argument0 is effect type constant
// argument1 is effect x position
// argument2 is effect y position
// argument3 is effect size
// argument4 is effect color constant
buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, EFFECT_CREATE)
buffer_write(global.tx_buff_server, buffer_u32, argument0)
buffer_write(global.tx_buff_server, buffer_u32, argument1)
buffer_write(global.tx_buff_server, buffer_u32, argument2)
buffer_write(global.tx_buff_server, buffer_u32, argument3)
network_send_packet( global.socket_client, global.tx_buff_server, buffer_tell(global.tx_buff_server) )


