extends Area3D



func _on_body_entered(body):
	print(str(body.name) + " Enter")
	pass # Replace with function body.


func _on_body_exited(body):
	print(str(body.name) + " Exit")
	pass # Replace with function body.
