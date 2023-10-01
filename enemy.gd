extends CharacterBody2D

@export var direction = -1
@export var detects_cliffs = true
var speed = 50

func _ready():
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.extents.x * direction
	$floor_checker.enabled = detects_cliffs
	
	if detects_cliffs:
		set_modulate(Color(1.2,0.5,1))
	

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction*-1
		$AnimatedSprite2D.flip_h = not $AnimatedSprite2D.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.extents.x * direction
		
		
	velocity.y += 20
	velocity.x = speed*direction
	
	move_and_slide() 

func _on_top_checker_body_entered(body):
	$AnimatedSprite2D.play("squashed")
	speed = 0
	set_collision_layer_value(16,false)
	set_collision_mask_value(1,false)
	$top_checker.set_collision_layer_value(16,false)
	$top_checker.set_collision_mask_value(1,false)
	$sides_checker.set_collision_layer_value(16,false)
	$sides_checker.set_collision_mask_value(1,false)
	$AudioStreamPlayer2D.play()
	$Timer.start()
	body.bounce()
	
	



func _on_sides_checker_body_entered(body):
	if (body.get_name() == "Lochi") or (body.get_name() == "Lochi2") :
		body.ouch(position.x)
		

func _on_timer_timeout():
	queue_free()
