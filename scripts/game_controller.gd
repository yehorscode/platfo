extends Node

var total_coins:int = 0

func collect_coin(val: int):
	total_coins+=val
	EventController.emit_signal("coin_collected", total_coins)

func show_death_screen():
	EventController.emit_signal("player_died")
