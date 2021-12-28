extends Control



func _ready():
	if Global.player_data["Points_Possible"] == Global.player_data["Points"]:
		$LevelCompleteLabel.text = "You Win!"
		$LevelCompleteLabel2.text = "You Got A Perfect Score!"
	else:
		$LevelCompleteLabel.text = "All Levels Complete!"
		$LevelCompleteLabel2.text = "You Missed " + str(Global.player_data["Points_Possible"] - Global.player_data["Points"]) + " Lights"

func _on_MainMenuBtn_pressed():
	get_tree().change_scene("res://Scenes/Interface/Menu_GameStart.tscn")
