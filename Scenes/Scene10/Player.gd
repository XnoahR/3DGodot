extends CharacterBody3D

var movement = Vector3(0,0,0)
@export var speed := 5.0
@export var rad = 0
@export var mouseSensitive = 0.1
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var mouseMoveX = -event.relative.x
		var mouseMoveY = event.relative.y
		rotate_y(mouseMoveX*mouseSensitive*0.1)

func _physics_process(delta):
	
	#Input and Set Speed at 0
	movement = Vector3.ZERO
	movement.x = Input.get_axis("ui_right","ui_left")
	movement.z = Input.get_axis("ui_down","ui_up")
	_show_cursor()
	
	
	#Param Character Rotation
	var offset = 0.02
	if(Input.is_action_pressed("right_lad")):
		rad -= offset
		rotate_y(-offset)
		
	if(Input.is_action_pressed("left_rad")):
		rad += offset
		rotate_y(offset)
	
	#look_at(position + -movement,Vector3.UP)
	#Rotate Player
	#movement = movement.rotated(Vector3.UP,rad)
	movement = (movement.x * transform.basis.x) + (movement.z * transform.basis.z)
	movement = movement.normalized()
	velocity = movement*speed
	if((velocity.length() != 0) and ($AnimationPlayer.current_animation != "Standard Walk")):
		$AnimationPlayer.play("Standard Walk")
	elif ((velocity.length() == 0) and ($AnimationPlayer.current_animation != "Standard Idle")):
		$AnimationPlayer.play("Standard Idle")
	print(movement)
	move_and_slide()
	pass

func _show_cursor():
	if(Input.is_action_just_pressed("ui_cancel")):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
