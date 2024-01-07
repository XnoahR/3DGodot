extends CharacterBody3D

var acceleration = Vector3(0,0,0)
@export var speed := 5.0



func _physics_process(delta):
	
	acceleration = Vector3.ZERO
	if(Input.is_action_pressed("ui_left")):
		#Move Left
		acceleration.x = -1
		#I want rotate/look left here
		#look_at_from_position(transform.origin,Vector3(-1,0,0),Vector3.UP)
		#look_at(Vector3(-1,0,0),Vector3.UP,true)
		look_at(position + Vector3(1, 0, 0), Vector3.UP)
	if(Input.is_action_pressed("ui_right")):
		#Move right
		acceleration.x = 1
		look_at(position + Vector3(-1, 0, 0), Vector3.UP)
		#look_at(Vector3(1,0,0),Vector3.UP,true)
		#look_at_from_position(transform.origin,Vector3(1,0,0),Vector3.UP)
	if(Input.is_action_pressed("ui_up")):
		#Move front
		acceleration.z = 1
		look_at(position + Vector3(0, 0, -1), Vector3.UP)
		#look_at_from_position(transform.origin,Vector3(0,0,0),Vector3.UP)
	if(Input.is_action_pressed("ui_down")):
		#Move back
		acceleration.z = -1
		look_at(position + Vector3(0, 0, 1), Vector3.UP)
		#look_at_from_position(transform.origin,Vector3(0,0,-1),Vector3.UP)
		
	velocity = acceleration*speed
	if((velocity.length() != 0) and ($AnimationPlayer.current_animation != "Standard Walk")):
		$AnimationPlayer.play("Standard Walk")
	elif ((velocity.length() == 0) and ($AnimationPlayer.current_animation != "Standard Idle")):
		$AnimationPlayer.play("Standard Idle")
		
	move_and_slide()
	pass
