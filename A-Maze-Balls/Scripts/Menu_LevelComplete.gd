extends Control



func _ready():
	pass

func _on_NextLevelBtn_pressed():
	Global.level_advance()

func _on_RetryLevelBtn_pressed():
	Global.load_level()

func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://Scenes/Interface/Menu_GameStart.tscn")
