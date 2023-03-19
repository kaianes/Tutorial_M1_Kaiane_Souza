extends KinematicBody2D


var velocity = Vector2.ZERO # player movment 
var move_speed = 150 # player velocity
var gravity = 1200 # cene gravity
var jump_force = -700 #player jump force

func _physics_process(delta: float) -> void: # funcion responsable for the player movment in the screen
	velocity.y += gravity * delta # gravity funcionability
	
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")) # character movment with the keyboard controls 
	velocity.x = move_speed * move_direction # "walk" funcionabily
	
	move_and_slide(velocity) # godot's funcion for the player's movement
	
	if Input.is_action_just_pressed("jump"): # jump funcionability concted to the keyboard controls
		velocity.y = jump_force/2 # player's jump funcionability
