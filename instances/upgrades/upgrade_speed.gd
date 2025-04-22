extends Area2D



func _on_body_entered(body):
	body.stepSize *= 1.5
	body.camera.zoom *= 0.9
	queue_free()


