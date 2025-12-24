extends StaticBody2D

var once : bool

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

func _on_area_2d_body_entered(body):
	if body.is_in_group("PL") && !once:
		anim.play("run")
		body.respone_pos = global_position
		once = true
	pass # Replace with function body.
