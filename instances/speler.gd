extends CharacterBody2D

var currentPosition = Vector2(0,0)
var previousPosition = Vector2(0,0)

func _input(event):
	if event.is_action_pressed("ui_right"):
		currentPosition.x += 32
	elif event.is_action_pressed("ui_left"):
		currentPosition.x -= 32
	elif event.is_action_pressed("ui_down"):
		currentPosition.y += 32
	elif event.is_action_pressed("ui_up"):
		currentPosition.y -= 32
	
	self.position = currentPosition

# Als BOTSING:
# 	speler moet terug naar vorige plaats


func _on_area_2d_area_entered(area):
	if area.get_parent() is Obstakel:
		currentPosition = previousPosition
		self.position = previousPosition

