extends Node

var total_coins = 0

func collect_coin(val: int):
	total_coins+=val
	EventController.emit_signal("coin_collected", total_coins)
