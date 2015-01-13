// https://www.yoyogames.com/tech_blog/11 for tutorial

// show_debug_message("networking event occurred")

var socket_id = ds_map_find_value( async_load, "id" )
var network_event_type = ds_map_find_value(async_load, "type")
var port = ds_map_find_value(async_load, "port")
var ip_addr_rx = ds_map_find_value(async_load, "ip")
var rx_buff = ds_map_find_value(async_load, "buffer")
//show_debug_message("Packet received from ip ="+string(ip_addr_rx)+", event id ="+string(socket_id)+", port ="+string(port))

if network_event_type == network_type_connect
{
    added_socket_id = ds_map_find_value(async_load, "socket")
    global.socket_client = added_socket_id
    show_debug_message("Network type connect received on socket = "+string(added_socket_id))
    if ip_addr_rx != global.ip_addr_server // remote connection
    {
        global.server_state = CONNECTED
        room_goto(room0)
    }
}
else if network_event_type == network_type_disconnect
{
    show_debug_message("Network disconnected")
    global.server_state = DISCONNECTED
}
else if ip_addr_rx == global.ip_addr_server // local
{
    if is_undefined(rx_buff)
    {
        show_debug_message("Packet contents undefined")
    }
    else
    {
        packet_type = buffer_read(rx_buff, buffer_u8)
        switch packet_type
        {
            case OBJ_POS:
            {
                p1_x = buffer_read(rx_buff, buffer_s32)
                p1_y = buffer_read(rx_buff, buffer_s32)
                break;
            }
            default: // unrecognized packet type
            {
                show_debug_message("Unrecognized packet type")
            }
        }
    }
}
else // from remote
{
    if is_undefined(rx_buff)
    {
        show_debug_message("Packet contents undefined")
    }
    else
    {
        packet_type = buffer_read(rx_buff, buffer_u8)
        switch packet_type
        {
            case OBJ_POS:
            {
                p2_x = buffer_read(rx_buff, buffer_s32)
                p2_y = buffer_read(rx_buff, buffer_s32)
                break;
            }
            default: // unrecognized packet type
            {
                show_debug_message("Unrecognized packet type")
            }
        }
    }
}

