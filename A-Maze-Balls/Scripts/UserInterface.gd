extends Control

var STATE

func _ready():
	STATE = "Gameplay"

func _physics_process(delta):
	if STATE == "Gameplay":
		set_display()

func set_display():
	$Lives_Count.text = String(Global.player_data["Lives"])
	$Score_Count.text = String(Global.player_data_level["Points"])
	$Flag_Count.text = String(Global.player_data_level["Checkpoints_Total"] - Global.player_data_level["Checkpoints_Complete"])
	$Level_Number.text = String(Global.player_data["Level_Current"])
