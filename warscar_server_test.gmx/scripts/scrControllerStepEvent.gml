switch room
{
    case roomLAN:
    {
        global.server_state = BROADCASTING
        break;
    }
    case room0:
    {
        // process previous input
        scrProcessInputPrevious(PLAYER1)
        scrProcessInputPrevious(PLAYER2)

        // process new input
        scrProcessInputNew(PLAYER1) // only player 1 because new input for other players comes through networking event
        
        // send local input to server
        buffer_seek(tx_buff_local_client, buffer_seek_start, 0)
        buffer_write(tx_buff_local_client, buffer_u8, INPUT) // send input
        buffer_write(tx_buff_local_client, buffer_bool, key_up[PLAYER1])
        buffer_write(tx_buff_local_client, buffer_bool, key_down[PLAYER1])
        buffer_write(tx_buff_local_client, buffer_bool, key_right[PLAYER1])
        buffer_write(tx_buff_local_client, buffer_bool, key_left[PLAYER1])
        buffer_write(tx_buff_local_client, buffer_bool, key_weapon[PLAYER1])
        network_send_packet( global.socket_local_client, tx_buff_local_client, buffer_tell(tx_buff_local_client) )
        
        // send position updates to remote client       
        buffer_seek(tx_buff_server, buffer_seek_start, 0)
        buffer_write(tx_buff_server, buffer_u8, OBJ_POS) // send object positions
        buffer_write(tx_buff_server, buffer_s32, player_x[PLAYER1])
        buffer_write(tx_buff_server, buffer_s32, player_y[PLAYER1])
        buffer_write(tx_buff_server, buffer_s32, player_x[PLAYER2])
        buffer_write(tx_buff_server, buffer_s32, player_y[PLAYER2])
        network_send_packet( global.socket_client, tx_buff_server, buffer_tell(tx_buff_server) )
        // show_debug_message("Sending player_x[PLAYER1] = "+string(player_x[PLAYER1])+", player_x[PLAYER2] = "+string(player_x[PLAYER2]))        

        // update positions in local game
        with player_object[PLAYER1]
        {
            x = other.player_x[PLAYER1]
            y = other.player_y[PLAYER1]
        }
        
        with player_object[PLAYER2]
        {
            x = other.player_x[PLAYER2]
            y = other.player_y[PLAYER2]
        }
        break;
    }
}
