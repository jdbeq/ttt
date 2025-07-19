extends Node
var game_field = load("res://play_field.tscn")
var start_screen = load("res://start_screen.tscn")
var game_over = load("res://game_over_screen.tscn")

func load_new_game() -> void:
	var new_game = game_field.instantiate()
	new_game.connect("game_over", _on_game_over)
	add_child(new_game)
	
func load_start_screen() -> void:
	var new_start_screen = start_screen.instantiate()
	add_child(new_start_screen)
	
func load_game_over() -> void:
	var new_game_over_screeb = game_over.instantiate()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_over() -> void:
	print("Restart...")
