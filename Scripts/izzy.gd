extends CharacterBody2D

@export var speed = 400
const jump_velocity = -500
var jumpcount=0
var counter=0


func _physics_process(delta):
	var direction=Input.get_axis('move_left','move_right')
	if not is_on_floor():
		velocity+=get_gravity() * delta
		if Input.is_action_just_pressed('ui_accept') and jumpcount<2:
			jumpcount+=1
			velocity.y=jump_velocity
	else:
		jumpcount=1
	
	if Input.is_action_just_pressed('ui_accept') and is_on_floor():
		velocity.y = jump_velocity
		
	if Input.is_action_pressed('move_left') or Input.is_action_pressed('move_right'):
		velocity.x=speed*direction
		
	if Input.is_action_pressed('move_down'):
		velocity.y+=100
		velocity.x=0
		
	if Input.is_action_pressed('dash') and (Input.is_action_pressed('move_left') or Input.is_action_pressed('move_right')):
		velocity.x=speed*direction*2
		counter += 1 
		if counter > 50:
			velocity.x=speed*direction
		elif Input.is_action_pressed('dash'):
			velocity.x=speed*direction*2
			counter=0
		
	move_and_slide()
	
	


#izzy's death


func _on_izzyarea_body_entered(body: Node2D) -> void:
	var damagenum=10
	print("hit something")
	if body.has_method("damage"):
		body.damage(damagenum)
