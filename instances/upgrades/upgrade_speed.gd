extends Area2D



func _on_body_entered(body):
	body.stepSize *= 1.1
	body.camera.zoom *= 0.98
	queue_free()


