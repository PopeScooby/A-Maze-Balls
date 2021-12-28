extends Area


func _ready():
	pass # Replace with function body.

func _on_Goalpost_body_entered(body):
	if body.name == "Ball_Soccer":
		if visible == true:
			visible = false
			Global.checkpoint_complete()

