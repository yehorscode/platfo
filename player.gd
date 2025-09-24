class_name Player extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -700.0
var dJump = true

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	elif is_on_floor():
		dJump = true
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y += JUMP_VELOCITY
	elif Input.is_action_just_pressed("jump") and not is_on_floor() and dJump == true:
		dJump = false
		velocity.y += JUMP_VELOCITY/2.5
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
func _process(delta: float) -> void:
	if self.position.y >= 10000:
		GameController.show_death_screen()
		self.queue_free()
