extends Node

const GAME = preload("res://Scene/Game/game.tscn")
const MAIN = preload("res://Scene/TitleScreen/main.tscn")

const SCROLL_SPEED = 120.0
const GROUP_PLANE = "Plane"


func load_game_scene():
	get_tree().change_scene_to_packed(GAME)
	
func load_main_scene():
	get_tree().change_scene_to_packed(MAIN)
