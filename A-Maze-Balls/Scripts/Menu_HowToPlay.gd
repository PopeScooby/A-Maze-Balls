extends Control

func _ready():
	pass

func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://Scenes/Interface/Menu_GameStart.tscn")
