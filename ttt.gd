extends Node
var game_field = preload("res://play_field.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_game = game_field.instantiate()
	add_child(new_game)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_field_restart() -> void:
	print("restart")
