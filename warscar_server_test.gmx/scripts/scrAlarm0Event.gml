// broadcast server info
show_debug_message("Sending broadcast message")

buffer_seek(global.tx_buff_broadcast, buffer_seek_start, 0)
buffer_write(global.tx_buff_broadcast, buffer_string, "WarScar Server #1")
network_send_broadcast( global.socket_client, 6511, global.tx_buff_broadcast, buffer_tell(global.tx_buff_broadcast) )

alarm[0] = room_speed * 3
