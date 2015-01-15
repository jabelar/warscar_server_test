buffer_seek(global.tx_buff_server, buffer_seek_start, 0)
buffer_write(global.tx_buff_server, buffer_u8, PLAYER_POS) // send object positions
buffer_write(global.tx_buff_server, buffer_s32, player_x[PLAYER1])
buffer_write(global.tx_buff_server, buffer_s32, player_y[PLAYER1])
buffer_write(global.tx_buff_server, buffer_s32, player_x[PLAYER2])
buffer_write(global.tx_buff_server, buffer_s32, player_y[PLAYER2])
network_send_packet( global.socket_client, global.tx_buff_server, buffer_tell(global.tx_buff_server) )
// show_debug_message("Sending player_x[PLAYER1] = "+string(player_x[PLAYER1])+", player_x[PLAYER2] = "+string(player_x[PLAYER2]))        

