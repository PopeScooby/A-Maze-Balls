extends Control



func _ready():
	pass 


func _on_RetryLevelBtn_pressed():
	Global.level_retry()


func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://Scenes/Interface/Menu_GameStart.tscn")


func _on_QuitGameBtn_pressed():
	get_tree().quit()
