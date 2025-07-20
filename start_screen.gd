extends Node2D

func _on_timer_timeout() -> void:
	Global.goto_scene("res://play_field.tscn")
