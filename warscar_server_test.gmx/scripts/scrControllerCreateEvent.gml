show_debug_message("Controller create event started")

scrConstants()

alarm[0] = room_speed * 3

global.server_state = DISCONNECTED

show_debug_message("Running server side")
global.socket_server = network_create_server(network_socket_tcp, 6511, 3)
show_debug_message("Creating server socket ="+string(global.socket_server))
global.ip_addr_server = "127.0.0.1" // on server the server is local
global.socket_client = network_create_socket(network_socket_tcp)
global.socket_local_client = network_create_socket(network_socket_tcp)
show_debug_message("Creating local client socket ="+string(global.socket_client))
network_connect(global.socket_local_client, global.ip_addr_server, 6511)
// create network buffer for sent messages
show_debug_message("Creating transmit buffer")
tx_buff_server = buffer_create( 256, buffer_grow, 1)
tx_buff_broadcast = buffer_create( 256, buffer_grow, 1)
tx_buff_client = buffer_create( 256, buffer_grow, 1)
tx_buff_local_client = buffer_create( 256, buffer_grow, 1)

// player objects are singletons but would like to loop through them
player_object[PLAYER1] = objPlayer1
player_object[PLAYER2] = objPlayer2

player_x[PLAYER1] = room_width/4
p1ayer_y[PLAYER1] = room_height/2
player_x[PLAYER2] = room_width/2
player_y[PLAYER2] = room_height/2

scrClearInput(PLAYER1)
scrClearInput(PLAYER2)

object_map = ds_map_create() // will contain list of all objects by id and type
