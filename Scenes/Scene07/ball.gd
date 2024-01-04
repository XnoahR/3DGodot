extends RigidBody3D


func _physics_process(delta):
	if(Input.is_action_pressed("ui_left")):
		apply_central_impulse(Vector3(-15*delta,0,0))
	if(Input.is_action_pressed("ui_right")):
		apply_central_impulse(Vector3(15*delta,0,0))
	if(Input.is_action_pressed("ui_up")):
		apply_central_force(Vector3(0,0,15))
	if(Input.is_action_pressed("ui_down")):
		apply_central_force(Vector3(0,0,-15))
	
	pass

func _on_rigid_body_3d_2_body_entered(body):
	print("yo")
	pass # Replace with function body.


func _on_body_entered(body):
	print(body.name)
	pass # Replace with function body.
