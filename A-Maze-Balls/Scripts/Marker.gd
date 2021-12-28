extends MeshInstance

var isActive = false

func _ready():
	pass

func _physics_process(delta):
	if isActive == true:
		$MeshInstance.visible = true

func _on_Area_body_entered(body):
	if body.name == "Ball_Soccer":
		if isActive == false:
			isActive = true
			Global.player_data_level["Points"] += 1
		else:
			if Global.player_data["Lives"] == 0:
				get_tree().change_scene("res://Scenes/Interface/Menu_GameOver.tscn")
			else:
				Global.player_data["Lives"] -= 1
				get_tree().change_scene("res://Scenes/Interface/Menu_LoseLife.tscn")
