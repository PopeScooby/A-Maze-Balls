extends Camera

var SHOTS = {0:{"Trans":Vector3(0,35,25),"Rot":Vector3(-62.5,0,0)},
			 1:{"Trans":Vector3(25,35,0),"Rot":Vector3(-62.5,90,0)},
			 2:{"Trans":Vector3(0,35,-25),"Rot":Vector3(-62.5,180,0)},
			 3:{"Trans":Vector3(-25,35,0),"Rot":Vector3(-62.5,-90,0)}}

func _ready():
	pass 
	
func _physics_process(delta):
	check_state()
	exec_state()

func check_state():
	pass

func exec_state():
	if Global.STATE_LEVEL == "Gameplay":
	
		if Input.is_action_just_pressed("lev_rot_right"):
			if Global.camera_data["Shot"] == 3:
				Global.camera_data["Shot"] = 0
			else:
				Global.camera_data["Shot"] += 1
		elif Input.is_action_just_pressed("lev_rot_left"):
			if Global.camera_data["Shot"] == 0:
				Global.camera_data["Shot"] = 3
			else:
				Global.camera_data["Shot"] -= 1
		
		set_camera()
		

func set_camera():
	self.translation = SHOTS[Global.camera_data["Shot"]]["Trans"]
	self.rotation_degrees = SHOTS[Global.camera_data["Shot"]]["Rot"]
