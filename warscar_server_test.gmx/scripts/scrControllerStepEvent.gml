switch room
{
    case roomLAN:
    {
        global.server_state = BROADCASTING
        break;
    }
    case room0:
    {
        if gamepad_button_check(1, gp_padd) then p1_y += 8
        if gamepad_button_check(1, gp_padu) then p1_y -= 8
        if gamepad_button_check(1, gp_padr) then p1_x += 8
        if gamepad_button_check(1, gp_padl) then p1_x -= 8
        
        if p1_x < 0 then p1_x = room0.room_width
        if p1_x > room0.room_width then p1_x = 0
        if p1_y < 0 then p1_y = room0.room_height
        if p1_y > room0.room_height then p1_y = 0
        
        buffer_seek(tx_buff_client, buffer_seek_start, 0)
        buffer_write(tx_buff_client, buffer_u8, 1) // joystick packet
        buffer_write(tx_buff_client, buffer_s32, p1_x)
        buffer_write(tx_buff_client, buffer_s32, p1_y)
        network_send_packet( global.socket_client, tx_buff_client, buffer_tell(tx_buff_client) )
        
        with objPlayer1
        {
            x = other.p1_x
            y = other.p1_y
        }
        
        with objPlayer2
        {
            x = other.p2_x
            y = other.p2_y
        }
        break;
    }
}
