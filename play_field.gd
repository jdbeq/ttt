extends Node2D
signal game_over

var Piece_X = preload("res://piece_x.tscn")
var Piece_O = preload("res://piece_o.tscn")

# Dictionary to keep track of active player 'name'.
var active_player = { 1:"X", -1:"O" }

# Grid used to calculate win conditions.
var magic_grid = [8,3,4,
				  1,5,9,
				  6,7,2]

# Array to keep track of board states.
var board = [0,0,0,
			 0,0,0,
			 0,0,0]

# Keeps track of the number of moves (Max 9)
var move_count = 0

# 1 for Player 1 (X) and -1 for Player 2 (O)
var turn = 1

func place_piece(pos, place) -> void:
	# Check if game has not ended in a draw.
	if move_count == 8:
		print("DRAW")
		game_over.emit()

	print(active_player[turn], "'s Move...")
	
	# Check if square is available.
	if board[place-1] != 0:
		print("Invalid Move")
	else:
		# Creates instance of piece and places it in center of square.
		# Marks position in board array with appropriate state.
		if turn < 0:
			var new_piece = Piece_X.instantiate()
			new_piece.position = pos
			add_child(new_piece)
			board[place -1 ] = turn
		else:
			var new_piece = Piece_O.instantiate()
			new_piece.position = pos
			add_child(new_piece)
			board[place -1 ] = turn	

	check_for_win()
	move_count = move_count + 1

	print("Move Count: ", move_count)
	# Switch active player
	turn *= -1

func check_for_win() -> void:
	for i in 8:
		for j in 8:
			for k in 8:
				if i != j and j != k and k != i:
					if board[i] == turn and board[j] == turn and board[k] == turn:
						if magic_grid[i] + magic_grid[j] + magic_grid[k] == 15:
							print(turn, " Wins!")
							game_over.emit()
							return

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_square_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print("1")
		place_piece($Square_1.position, 1)

func _on_square_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('2')
		place_piece($Square_2.position,2)

func _on_square_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('3')
		place_piece($Square_3.position,3)

func _on_square_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('4')
		place_piece($Square_4.position,4)

func _on_square_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('5')
		place_piece($Square_5.position,5)

func _on_square_6_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('6')
		place_piece($Square_6.position,6)

func _on_square_7_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('7')
		place_piece($Square_7.position,7)

func _on_square_8_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('8')
		place_piece($Square_8.position,8)

func _on_square_9_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if (event is InputEventMouseButton && event.pressed):
		print('9')
		place_piece($Square_9.position,9)
