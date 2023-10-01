extends CharacterBody2D

const SPEED = 180
const JUMPFORCE = -700
const GRAVITY = 20
var coins = 0

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite2D.play("walk")
		$Sprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite2D.play("walk")
		$Sprite2D.flip_h = true
	else:
		$Sprite2D.play("idle")
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$sound_jump.play()
		$Sprite2D.play("jump")
	
	move_and_slide()
	
	velocity.x = lerp(velocity.x,0.0,0.1)
	
	

func _on_fallzone_body_entered(body):
	Global.lose_life()
	if Global.lives >= 1:
		get_tree().reload_current_scene()
		

func bounce():
	velocity.y = JUMPFORCE*0.5
	
func ouch(posx):
	Global.lose_life()
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = JUMPFORCE*0.3
	if position.x < posx:
		velocity.x = -600
	else:
		velocity.x = 600
		
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()
		
	


func _on_timer_timeout():
	set_modulate(Color(1,1,1,1))
	
