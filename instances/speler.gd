extends CharacterBody2D
var obstakelScene = preload("res://instances/obstakel.tscn")
var speedUpgradeScene = preload("res://instances/upgrades/upgrade_speed.tscn")
@onready var camera = $Camera2D
var currentPosition = Vector2(0,0)
var previousPosition = Vector2(0,0)
var stepSize = 64
var inputAllowed = true
@onready var gameOver = $CanvasLayer/gameOver

func _input(event):
	if inputAllowed:
		if event.is_action_pressed("ui_right"):
			previousPosition = currentPosition
			currentPosition.x += stepSize
			obstaclePlacer(currentPosition)
		elif event.is_action_pressed("ui_left"):
			previousPosition = currentPosition
			currentPosition.x -= stepSize
			obstaclePlacer(currentPosition)
		elif event.is_action_pressed("ui_down"):
			previousPosition = currentPosition
			currentPosition.y += stepSize
			obstaclePlacer(currentPosition)
		elif event.is_action_pressed("ui_up"):
			previousPosition = currentPosition
			currentPosition.y -= stepSize
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
	
	var nieuwObject = null
	if randi_range(0,9) == 1:
		#plaats upgrade
		nieuwObject= speedUpgradeScene.instantiate()
	else:
		nieuwObject = obstakelScene.instantiate()
	get_parent().add_child(nieuwObject)
	nieuwObject.position = richting
	
func _on_area_2d_area_entered(area):
	if area is Obstakel:
		currentPosition = previousPosition
		self.position = previousPosition
	elif area is danger:
		inputAllowed = false
		gameOver.visible = true

