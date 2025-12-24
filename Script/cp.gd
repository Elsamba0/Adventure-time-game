extends Area2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var once : bool

func _on_body_entered(body):
	if body.is_in_group("PL") && !once:
		body.respone_pos = global_position
		anim.play("out")
		once = true
	pass # Replace with function body.



func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "out":
		anim.play("run")
	pass # Replace with function body.
