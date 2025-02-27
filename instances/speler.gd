extends CharacterBody2D
var obstakelScene = preload("res://instances/obstakel.tscn")

var currentPosition = Vector2(0,0)
var previousPosition = Vector2(0,0)

func _input(event):
	if event.is_action_pressed("ui_right"):
		previousPosition = currentPosition
		currentPosition.x += 32
		obstaclePlacer(currentPosition)
	elif event.is_action_pressed("ui_left"):
		previousPosition = currentPosition
		currentPosition.x -= 64
		obstaclePlacer(currentPosition)
	elif event.is_action_pressed("ui_down"):
		previousPosition = currentPosition
		currentPosition.y += 32
		obstaclePlacer(currentPosition)
	elif event.is_action_pressed("ui_up"):
		previousPosition = currentPosition
		currentPosition.y -= 32
		obstaclePlacer(currentPosition)

	self.position = currentPosition


# Als BOTSING:
# 	speler moet terug naar vorige plaats

func obstaclePlacer(playerPosition):
	#elke keer de speler beweegt, kans om een obstakel te plaatsen
	var hoek = randf_range(1,360)*PI/180
	
	var richting = Vector2(0,0)
	richting.x = playerPosition.x + cos(hoek)*randf_range(400,600)
	richting.y = playerPosition.y + sin(hoek)*randf_range(400,600)
	
	var nieuwObstakel = obstakelScene.instantiate()
	get_parent().add_child(nieuwObstakel)
	nieuwObstakel.position = richting
	
func _on_area_2d_area_entered(area):
	if area.get_parent() is Obstakel:
		currentPosition = previousPosition
		self.position = previousPosition

