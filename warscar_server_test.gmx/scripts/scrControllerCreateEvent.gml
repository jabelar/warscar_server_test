show_debug_message("Controller create event started")

scrConstants()

alarm[0] = room_speed * 3

show_debug_message("Running server side")
global.socket_server = network_create_server(network_socket_tcp, 6511, 3)
show_debug_message("Creating server socket ="+string(global.socket_server))
global.ip_addr_server = "127.0.0.1" // on server the server is local
global.socket_client = network_create_socket(network_socket_tcp)
show_debug_message("Creating local client socket ="+string(global.socket_client))
network_connect(global.socket_client, global.ip_addr_server, 6511)
connected = false // this is related to remote connection
// create network buffer for sent messages
show_debug_message("Creating transmit buffer")
tx_buff_server = buffer_create( 256, buffer_grow, 1)
tx_buff_client = buffer_create( 256, buffer_grow, 1)

p1_x = room0.room_width/4
p1_y = room0.room_height/2
p2_x = room0.room_width/2
p2_y = room0.room_height/2
