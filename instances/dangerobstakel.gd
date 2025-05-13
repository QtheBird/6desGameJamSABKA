extends Area2D
class_name danger



func _on_body_entered(body):
	body.inputAllowed = false
	body.gameOver.visible = true
