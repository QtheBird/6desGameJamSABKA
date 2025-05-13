extends Area2D
class_name Obstakel




func _on_body_entered(body):
		body.currentPosition = body.previousPosition
		body.position = body.previousPosition
