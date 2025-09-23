extends Node2D

@export var value: int = 1

func _on_area_2d_body_entered(body):
	if body is Player:
		GameController.collect_coin(value)
		self.queue_free()
