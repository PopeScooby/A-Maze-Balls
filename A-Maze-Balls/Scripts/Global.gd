extends Node

var STATE_GLOBAL
var STATE_PLAYER
var STATE_LEVEL

var player_info = {"SpeedMax":10,"Motion":Vector3.ZERO,"Dir_Prev":Vector3(0,1,0),"Dir_Curr":Vector3.ZERO}
var player_data_level = {"Points":0, "Points_Possible":0,"Checkpoints_Complete":0,"Checkpoints_Total":0}
var player_data = {"Lives":3, "Points":0, "Level_Current":1, "Points_Possible":0}

var camera_data = {"Shot":0}

func _ready():
	pass 

func new_game():
	reset_variables()
	level_advance()

func reset_variables():
	player_data["Lives"] = 3
	player_data["Points"] = 0
	player_data["Level_Current"] = 0
	player_data_level["Points"] = 0
	player_data_level["Checkpoints_Complete"] = 0

func level_advance():
	player_data["Level_Current"] += 1
	player_data["Points"] = player_data_level["Points"]
	player_data["Points_Possible"] += player_data_level["Points_Possible"]
	player_data_level["Checkpoints_Complete"] = 0
	load_level()

func level_retry():
	player_data_level["Points"] = player_data["Points"]
	player_data_level["Checkpoints_Complete"] = 0
	load_level()

func load_level():
	var Level_Suffix = "0" + String(player_data["Level_Current"])
	Level_Suffix = Level_Suffix.right(Level_Suffix.length() - 2)
	var Level_Scene_Path = "res://Scenes/Levels/Level_" + Level_Suffix + ".tscn"
	get_tree().change_scene(Level_Scene_Path)

func checkpoint_complete():
	player_data_level["Checkpoints_Complete"] += 1
	if player_data_level["Checkpoints_Complete"] == player_data_level["Checkpoints_Total"]:
		level_complete()

func level_complete():
	var level_next_file = File.new()
	var Level_Suffix = "0" + String(player_data["Level_Current"] + 1)
	Level_Suffix = Level_Suffix.right(Level_Suffix.length() - 2)
	var Level_Scene_Path = "res://Scenes/Levels/Level_" + Level_Suffix + ".tscn"
	if level_next_file.file_exists(Level_Scene_Path):
		get_tree().change_scene("res://Scenes/Interface/Menu_LevelComplete.tscn")
	else:
		get_tree().change_scene("res://Scenes/Interface/Menu_YouWin.tscn")
