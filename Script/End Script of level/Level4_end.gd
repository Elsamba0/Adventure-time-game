extends Area2D

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
@export var parent : Node2D

func _on_body_entered(body):
	if body.is_in_group("PL"):
		if parent.can_win:
			anim.play("run")
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "run":
		Transions.change_scene("res://Sence/level_5.tscn")
	pass # Replace with function body.
