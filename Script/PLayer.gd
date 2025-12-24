extends CharacterBody2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
@onready var rayG : Node2D = $rays
@onready var WDelay : Timer = $Timers/WDelay
@onready var WJump : Timer = $Timers/WJump
@onready var WCoyote : Timer = $Timers/WCoyote

@export var speed : float = 200.0
@export var jump_vel : float = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var dir : float
var has_Djump : bool
var respone_pos
var anim_lock : bool
var die : bool = false
var l_pos : bool = true

func _ready():
	
	respone_pos = global_position
	add_exp()

func add_exp():
	for ray in rayG.get_children():
		(ray as RayCast2D).add_exception(self)

func _physics_process(delta):
	die_F()
	if anim_lock:
		
		Anim()
		Move()
		Jump(delta)
		Wall_Jump(delta)
		Void()

func Void():
	if global_position.y >= 750:
		if !is_on_floor():
			position = respone_pos
			anim.play("App")
			anim_lock = false
			l_pos = false

func Wall_Jump(delta):
	if !is_on_floor():
		if is_on_wall():
			if sign(dir) != 0:
				if WDelay.is_stopped():
					velocity.y = clamp(velocity.y, -gravity * 5 * delta, gravity * delta * 5)
					WCoyote.start()
	
	if onWall():
		if WDelay.is_stopped():
			if Input.is_action_just_pressed("jump"):
				if !WCoyote.is_stopped():
					WJump.start()
					if onRWall():
						velocity.x = -speed * 2 
					if onLWall():
						velocity.x = speed * 2 
					velocity.y = jump_vel
					WDelay.start()

func Move():
	dir = Input.get_axis("left", "right")
	if dir:
		if WJump.is_stopped():
			velocity.x = dir * speed
			anim.scale.x = dir
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()

func Jump(delta):
	if is_on_floor():
		has_Djump = true
		if Input.is_action_just_pressed("jump"): 
			velocity.y = jump_vel
			WDelay.start()
	else:
		if Input.is_action_just_pressed("jump"):
			if has_Djump:
				velocity.y = jump_vel
				has_Djump = false
			
		velocity.y += gravity * delta

func Anim():
	
	if is_on_floor():
		if dir == 0:
			anim.play("idel")
		else:
			anim.play("run")
	else:
		if is_on_wall() and sign(dir) != 0:
			anim.play("wJump")
		elif velocity.y < 0:
			anim.play("jump")
		else:
			anim.play("fall")

func die_F():
	if !is_on_floor():
		if velocity.y >= 700:
			die = true
	else:
		if die && l_pos:
			anim_lock = false
			anim.play("disapp")
			die = false

func onWall():
	for ray in rayG.get_children():
		if (ray as RayCast2D).is_colliding():
			return true
	return false

func onRWall():
	for ray in rayG.get_children():
		if (ray as RayCast2D).is_colliding():
			if ray.is_in_group("R"):
				return true
	return false

func onLWall():
	for ray in rayG.get_children():
		if (ray as RayCast2D).is_colliding():
			if ray.is_in_group("L"):
				return true
	return false


func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "App":
		anim_lock = true
	
	if anim.animation == "disapp":
		anim_lock = true
		position = respone_pos
	pass # Replace with function body.
