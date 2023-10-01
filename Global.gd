extends Node

var maxLives = 3
var lives = maxLives
var hud
var prevScene 

func lose_life():
	lives -= 1
	hud.load_hearts()
	if lives <= 0:
		get_tree().change_scene_to_file("res://GameLost.tscn")
		prevScene = get_tree().current_scene.name
