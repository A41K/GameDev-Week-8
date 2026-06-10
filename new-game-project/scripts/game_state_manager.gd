extends Node

@export var mines_grid: MinesGrid
@export var ui: UI

@onready var timer: Timer = $Timer

var time_elapse = 0

func _ready():
	mines_grid.game_lost.connect(on_game_lost)
	mines_grid.game_won.connect(on_game_won)
	mines_grid.flag_change.connect(on_flag_change)
	ui.set_mine_count(mines_grid.number_of_mines)


func on_flag_change(flag_count: int):
	ui.set_mine_count(mines_grid.number_of_mines - flag_count)
	print(flag_count)
	

func _on_timer_timeout():
	time_elapse += 1
	ui.set_timer_count(time_elapse)
	
func on_game_lost():
	timer.stop()
	ui.game_lost()

func on_game_won():
	timer.stop()
	ui.game_won()
