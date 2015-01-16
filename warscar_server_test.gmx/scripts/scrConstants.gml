// players
globalvar PLAYER1, PLAYER2;
PLAYER1 = 0
PLAYER2 = 1

// server state
globalvar DISCONNECTED, BROADCASTING, CONNECTED;
DISCONNECTED = 0
BROADCASTING = 1
CONNECTED = 2

// packet types to client
// ** THESE MUST BE SAME VALUES ON CLIENT SIDE
globalvar OBJ_CREATE, OBJ_POS, OBJ_DESTROY, SOUND_PLAY, EFFECT_CREATE;
OBJ_CREATE = 0
PLAYER_POS = 1
OBJ_DESTROY = 2
SOUND_PLAY = 3
EFFECT_CREATE = 4

// packet types from client
globalvar INPUT;
INPUT = 0

// object types
globalvar OBSTACLE, FLAG, BULLET;
OBSTACLE = 0
FLAG = 1
BULLET = 2

// sound types
globalvar SOUND_MAIN_GUN;
SOUND_MAIN_GUN = 0
