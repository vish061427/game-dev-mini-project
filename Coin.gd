extends Area2D

signal coin_collected



func _on_body_entered(body):
	$AnimationPlayer.play("bounce")
	emit_signal("coin_collected")
	set_collision_mask_value(1,false)
	$AudioStreamPlayer2D.play()
	
	


func _on_animation_player_animation_finished(anim_name):
	queue_free()

