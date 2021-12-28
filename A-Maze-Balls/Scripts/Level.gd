extends Spatial

export (int) var Checkpoints

#STATES
#	"Loading":
#	"Playing":

var STATE = ""

func _ready():	
	Global.STATE_LEVEL = "Loading"
	Global.player_data_level["Checkpoints_Total"] = self.Checkpoints
	Global.player_data_level["Points_Possible"] = $Markers.get_child_count()
	
func _physics_process(delta):
	check_state()
	exec_state()

func check_state():
	pass

func exec_state():
	if Global.STATE_LEVEL == "Loading":
		exec_state_loading()

func exec_state_loading():
	Global.player_data_level["Checkpoints_Total"] = Checkpoints
	var anim_name = "Start_Camera_" + str(Global.camera_data["Shot"])
	$AnimationPlayer.play(anim_name)

func _on_AnimationPlayer_animation_finished(anim_name):
	if "Start_Camera" in anim_name:
		Global.STATE_LEVEL = "Gameplay"
