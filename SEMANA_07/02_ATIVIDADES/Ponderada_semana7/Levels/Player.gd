extends KinematicBody2D

var velocity = Vector2.ZERO # player movment 
var move_speed = 480 # player velocity
var gravity = 1200 # cene gravity
var jump_force = -600 #player jump force 
var is_grounded = true # var that ferifies if the player is on the ground
onready var raycasts = $raycasts # "onready" say's about the var whem it is ready

func _physics_process(delta): # main funcion responsable for the physics and movment in the screen
	if is_grounded == false:
		velocity.y += gravity * delta # gravity funcionability
		
		
	_get_input() # call the funtion
	move_and_slide(velocity) # godot's funcion for the player's movement
	
	is_grounded = _check_is_grounded() # call the function and atribute a new value for the var "is_grounded"
	
	_set_animation() #call the funcion
	

	#if is_grounded == false:
		#gravity = $texture.move_local_y(delta)
		
		
func _get_input(): # here all the aspects from the player movment are  deteild
	
	velocity.x = 0 #defines the inicial player velocity as zero
	
	var move_direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left")) # character movment with the keyboard controls 
	velocity.x = lerp(velocity.x, move_speed * move_direction, 0.2) # "walk" funcionabily and verisimilitude
	 
	if move_direction !=0: # creates a condition on the player's movment
		$texture.scale.x = move_direction # tunr ouver the sprite depending for with side the player is moving

func _input(event: InputEvent): # funcion that rules the jump action
	if event.is_action_pressed("jump") and is_grounded:
		velocity.y = jump_force / 2
		is_grounded = false
		
func _check_is_grounded(): # func that make the gravity of the game more real
	for raycast in raycasts.get_children(): # verifies if the player is on the ground
		if raycast.is_colliding():
			return true
	return false


func _set_animation(): # funcion that defines wich animation is playing
	if velocity.x == 0 and is_grounded:
		$texture.play("Idle")
	elif velocity.x != 0 and is_grounded: 
		$texture.play("Run")
	elif is_grounded == false:
		$texture.play("Jump")


func _on_fallZone_body_entered(body):
	get_tree().reload_current_scene()
