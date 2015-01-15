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
        scrSendLocalInput(PLAYER1)
        
        // send position updates to remote client 
        scrSendPlayerPositions()      

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
