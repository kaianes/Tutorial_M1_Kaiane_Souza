extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_mouse_entered():
	$Iniciar.visible = false
	$IniciarPressed.visible = true

func _on_Button_mouse_exited():
	$Iniciar.visible = true
	$IniciarPressed.visible = false
	
func _on_Button2_mouse_entered():
	$Infos.visible = false
	$InfosPressed.visible = true
	

func _on_Button2_mouse_exited():
	$Infos.visible = true
	$InfosPressed.visible = false


func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn")

func _on_Button2_pressed():
	get_tree().change_scene("res://Scenes/Infos.tscn")
