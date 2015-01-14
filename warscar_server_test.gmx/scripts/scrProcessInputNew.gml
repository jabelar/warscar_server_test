// argument0 is player constant
scrClearInput(argument0)

if gamepad_button_check(1, gp_padd) then key_down[argument0] = true
if gamepad_button_check(1, gp_padu) then key_up[argument0] = true
if gamepad_button_check(1, gp_padr) then key_right[argument0] = true 
if gamepad_button_check(1, gp_padl) then key_left[argument0] = true

if gamepad_button_check_pressed(1, gp_shoulderr) or gamepad_button_check_pressed(1, gp_shoulderrb) then key_weapon[argument0] = true

