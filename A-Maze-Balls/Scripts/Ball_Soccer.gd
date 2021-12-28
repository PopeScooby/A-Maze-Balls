extends KinematicBody

#STATES
#	Loading:
#	Move: 

func _ready():
	Global.STATE_PLAYER = "Loading"

func _physics_process(delta):
	check_state()
	exec_state(delta)

func check_state():
	if Global.STATE_LEVEL == "Gameplay":
		if Input.is_action_just_pressed("game_pause"):
			Global.STATE_LEVEL = "Pause"
		else:
			Global.STATE_PLAYER = "Move"
	elif Global.STATE_LEVEL == "Pause":
		if Input.is_action_just_pressed("game_pause"):
			Global.STATE_LEVEL = "Move"
		else:
			Global.STATE_PLAYER = "Pause"

func exec_state(delta):
	
	if Global.STATE_PLAYER == "Move":
		exec_state_move(delta)

func exec_state_move(delta):
	Global.player_info["Motion"].y = -.5
	
	if Global.camera_data["Shot"] == 0:
		
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].x = 0
		elif Input.is_action_pressed("ui_right"):
			 Global.player_info["Motion"].x = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(-Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].x = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].x = 0
		
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].z = 0
		elif Input.is_action_pressed("ui_up"):
			 Global.player_info["Motion"].z = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(-Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].z = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].z = 0
	
	elif Global.camera_data["Shot"] == 1:
		
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].z = 0
		elif Input.is_action_pressed("ui_right"):
			 Global.player_info["Motion"].z = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(-Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].z = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].z = 0
		
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].x = 0
		elif Input.is_action_pressed("ui_up"):
			 Global.player_info["Motion"].x = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].x = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(-Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].x = 0
	
	elif Global.camera_data["Shot"] == 2:
		
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].x = 0
		elif Input.is_action_pressed("ui_right"):
			 Global.player_info["Motion"].x = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].x = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(-Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].x = 0
		
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].z = 0
		elif Input.is_action_pressed("ui_up"):
			 Global.player_info["Motion"].z = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].z = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(-Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].z = 0
	
	elif Global.camera_data["Shot"] == 3:
		
		if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].z = 0
		elif Input.is_action_pressed("ui_right"):
			 Global.player_info["Motion"].z = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_left"):
			 Global.player_info["Motion"].z = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_x(-Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].z = 0
		
		if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].x = 0
		elif Input.is_action_pressed("ui_up"):
			 Global.player_info["Motion"].x = Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(-Global.player_info["SpeedMax"] * delta)
		elif Input.is_action_pressed("ui_down"):
			 Global.player_info["Motion"].x = -Global.player_info["SpeedMax"]
			 $MeshInstance.rotate_z(Global.player_info["SpeedMax"] * delta)
		else:
			Global.player_info["Motion"].x = 0
	
	move_and_slide(Global.player_info["Motion"])
	

