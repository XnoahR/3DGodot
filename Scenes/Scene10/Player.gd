extends CharacterBody3D

var acceleration = Vector3(0,0,0)
@export var speed := 5.0
@export var rad = 0

func _physics_process(delta):
	
	acceleration = Vector3.ZERO
	acceleration.x = Input.get_axis("ui_left","ui_right")
	acceleration.z = Input.get_axis("ui_up","ui_down")

	var offset = 0.02
	if(Input.is_action_pressed("left_rad")):
		rad -= offset
		rotate_y(-offset)
		
	if(Input.is_action_pressed("right_lad")):
		rad += offset
		rotate_y(offset)
	
	#look_at(position + -acceleration,Vector3.UP)
	acceleration = acceleration.rotated(Vector3.UP,rad)
	velocity = acceleration*speed
	if((velocity.length() != 0) and ($AnimationPlayer.current_animation != "Standard Walk")):
		$AnimationPlayer.play("Standard Walk")
	elif ((velocity.length() == 0) and ($AnimationPlayer.current_animation != "Standard Idle")):
		$AnimationPlayer.play("Standard Idle")
	
	move_and_slide()
	pass
