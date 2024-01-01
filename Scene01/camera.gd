extends Node3D

var camera
# Called when the node enters the scene tree for the first time.
func _ready():
	camera = $Camera3D
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_camera_move(delta)
	pass


func _camera_move(delta):
	if(Input.is_action_pressed("ui_up")):
		camera.transform.origin += Vector3(0,0,5*delta)
	if(Input.is_action_pressed("ui_down")):
		camera.transform.origin += Vector3(0,-0.1,0)
	if(Input.is_action_pressed("ui_left")):
		camera.transform.origin += Vector3(-0.1,0,0)
	if(Input.is_action_pressed("ui_right")):
		camera.transform.origin += Vector3(0.1,0,0)
	
