extends CharacterBody2D
const speed=500
var possivals = [-100,-50,-10,-1,1,10,50,100]
var direction = possivals.pick_random()
var health = 100

signal health_neg(new_health)

func _physics_process(delta):
	velocity.x+=direction
	move_and_slide()
	
	if not is_on_floor():
		velocity.y+=speed*delta*2
	
	if is_on_floor():
		velocity.y-=speed*delta*100
		direction = possivals.pick_random()
		
	if is_on_wall():
		direction=possivals.pick_random()


@export var damagenum = 10

func damage(amount):
	health -= amount
	emit_signal('health_neg',health)
	if health<=0:
		die()
		

func die():
	get_tree().change_scene_to_file("res://scenes/sprite_2d.tscn")
