extends CanvasLayer

var coins = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	$Coins.text = str(coins)
	load_hearts()
	Global.hud = self
		

func _on_coin_collected():
	coins = coins + 1
	_ready()
	if coins == 8 and get_tree().current_scene.name == "Level0":
		Global.lives = Global.maxLives
		get_tree().change_scene_to_file("res://level_1.tscn")
		Global.prevScene = get_tree().current_scene.name		
		
	elif coins == 8 and get_tree().current_scene.name == "Level1":
		Global.lives = Global.maxLives
		get_tree().change_scene_to_file("res://level_2.tscn")
		Global.prevScene = get_tree().current_scene.name		
	
		
		

func _on_coin_coin_collected():
	coins = coins + 1
	_ready()
	if coins == 8:
		get_tree().change_scene_to_file("res://Game_won.tscn")
		

func load_hearts():
	$HeartsFull.size.x = Global.lives * 53
	$HeartsEmpty.size.x = (Global.maxLives - Global.lives) * 53
	$HeartsEmpty.position.x = $HeartsFull.position.x + $HeartsFull.size.x * $HeartsFull.scale.x
	print($HeartsEmpty.position.x)
	print($HeartsFull.position.x )
	
