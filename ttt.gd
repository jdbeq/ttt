extends Node


func _ready() -> void:
	Global.goto_scene("res://start_screen.tscn")
	
func _on_replay() -> void:
	print("STARTING OVER...")
	
func _on_game_over() -> void:
	print("Game Over...")
	
