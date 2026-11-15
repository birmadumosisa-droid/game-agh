extends CharacterBody2D

## attributes/states
var health = 100
var currentState = "default"

@onready var player1: CharacterBody2D = $"."
@onready var player1sprite: AnimatedSprite2D = $player1Sprite
@onready var sound1 = $AudioStreamPlayer
## export movement
@export var p1_left := "p1_left"
@export var p1_right := "p1_right"
@export var p1_jump := "p1_jump"
@export var p1_duck := "p1_duck"
## export hits
@export var p1_punch := "p1_punch"
@export var p1_superability := "p1_superability"
## export gravity 
@export var speed = 500
@export var gravity = 980
@export var jump_force = -400
var doubleJump = false


func _physics_process(delta): # movement function 
	if not is_on_floor() && not doubleJump: # make gravity pull player down to ground 
		velocity.y += gravity * delta
	elif is_on_floor():
		doubleJump = false
	
	if Input.is_action_just_pressed("p1_jump"): # make player jump when press space 
		velocity.y = jump_force
		if doubleJump:
			velocity.y *= 2
	## horizontal movement 
	var move_direction = Input.get_axis("p1_left", "p1_right") 
	velocity.x =  move_direction * speed # set side to side speed 
	
	## animation logic
	if not is_on_floor():
		player1sprite.play("jump")
	elif velocity.x != 0:
		player1sprite.play("run")
	else: 
		player1sprite.play("default")
	## gravity/state logic
	
	if currentState == "running":
			player1sprite.play("run")
			






		## flip logic
	if move_direction < 0:
			print("going backwards")
			player1sprite.flip_h = true
	elif move_direction > 0:
			print("going forward")
			player1sprite.flip_h = false
		#### 
	move_and_slide()
	doubleJump = false




##func _input(event: InputEvent) -> void: ## input events
			##if event is InputEventKey:  
					##if event.pressed && event.button_index == 1: ## E
						##print("hi")


##func _on_pickup_area_area_entered(area: Area2D) -> void: ## referring to the orange's area
		##if area.is_in_group("ringGroup") and not $pickupRing.visible: ## if that is a ring, then delete it
			##area.queue_free() ## free from the workspace
			##$pickupRing.visible = true ## make orange
			##speed = speed * 5 
			# play a sound 
			
		##if area.is_in_group("basketGroup") and $pickupRing.visible: # if object touched is the bascket
			##$pickupRing.visible = false
			##$pickupRing.queue_free()
			##speed = speed / 5
			##ringCount += 1
			# add 1 to rings counter
			##$CanvasLayer/ringCountDisplay.text = "Rings: " + str(ringCount)
