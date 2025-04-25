extends Control


var level1 = preload("res://levels/level1.tscn")

func _on_start_pressed():
	get_tree().change_scene_to_packed(level1)
