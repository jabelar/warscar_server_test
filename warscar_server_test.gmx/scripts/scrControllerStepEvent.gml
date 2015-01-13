switch room
{
    case roomLAN:
    {
        global.server_state = BROADCASTING
        break;
    }
    case room0:
    {
        key_up[PLAYER1] = false
        key_down[PLAYER1] = false
        key_right[PLAYER1] = false
        key_left[PLAYER1] = false
        key_weapon[PLAYER1] = false
        
        key_up[PLAYER2] = false
        key_down[PLAYER2] = false
        key_right[PLAYER2] = false
        key_left[PLAYER2] = false
        key_weapon[PLAYER2] = false
        
        if gamepad_button_check(1, gp_padd) then key_down[PLAYER1] = true //p1_y += 8
        if gamepad_button_check(1, gp_padu) then key_up[PLAYER1] = true // p1_y -= 8
        if gamepad_button_check(1, gp_padr) then key_right[PLAYER1] = true // p1_x += 8
        if gamepad_button_check(1, gp_padl) then key_left[PLAYER1] = true // p1_x -= 8
        
        if key_down[PLAYER1] then player_y[PLAYER1] += 8
        if key_up[PLAYER1] then player_y[PLAYER1] -= 8
        if key_right[PLAYER1] then player_x[PLAYER1] += 8
        if key_left[PLAYER1] then player_x[PLAYER1] -= 8
               
        if player_x[PLAYER1] < 0 then player_x[PLAYER1] = room0.room_width
        if player_x[PLAYER1] > room0.room_width then player_x[PLAYER1] = 0
        if player_y[PLAYER1] < 0 then player_y[PLAYER1] = room0.room_height
        if player_y[PLAYER1] > room0.room_height then player_y[PLAYER1] = 0

                
        if key_down[PLAYER2] then player_y[PLAYER2] += 8
        if key_up[PLAYER2] then player_y[PLAYER2] -= 8
        if key_right[PLAYER2] then player_x[PLAYER2] += 8
        if key_left[PLAYER2] then player_x[PLAYER2] -= 8
                       
        if player_x[PLAYER2] < 0 then player_x[PLAYER2] = room0.room_width
        if player_x[PLAYER2] > room0.room_width then player_x[PLAYER2] = 0
        if player_y[PLAYER2] < 0 then player_y[PLAYER2] = room0.room_height
        if player_y[PLAYER2] > room0.room_height then player_y[PLAYER2] = 0

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
        
        with objPlayer1
        {
            x = other.player_x[PLAYER1]
            y = other.player_y[PLAYER1]
        }
        
        with objPlayer2
        {
            x = other.player_x[PLAYER2]
            y = other.player_y[PLAYER2]
        }
        break;
    }
}
