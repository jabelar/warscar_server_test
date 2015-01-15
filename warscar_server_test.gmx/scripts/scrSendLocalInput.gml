// argument0 is player constant (to allow multiple local controllers as well)
buffer_seek(global.tx_buff_local_client, buffer_seek_start, 0)
buffer_write(global.tx_buff_local_client, buffer_u8, INPUT) // send input
buffer_write(global.tx_buff_local_client, buffer_bool, key_up[argument0])
buffer_write(global.tx_buff_local_client, buffer_bool, key_down[argument0])
buffer_write(global.tx_buff_local_client, buffer_bool, key_right[argument0])
buffer_write(global.tx_buff_local_client, buffer_bool, key_left[argument0])
buffer_write(global.tx_buff_local_client, buffer_bool, key_weapon[argument0])
network_send_packet( global.socket_local_client, global.tx_buff_local_client, buffer_tell(global.tx_buff_local_client) )

