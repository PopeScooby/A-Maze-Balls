extends Control

var STATE = "Loading"

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_start"):
		_on_NewGameBtn_pressed()

func _on_NewGameBtn_pressed():
	Global.new_game()
#
#func _on_ContinueBtn_pressed():
#	pass 
#
func _on_HowToPlayBtn_pressed():
	get_tree().change_scene("res://Scenes/Interface/Menu_HowToPlay.tscn")

func _on_QuitGameBtn_pressed():
	get_tree().quit()
	


