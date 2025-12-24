extends Area2D
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
var t : bool = false
func _on_body_entered(body):
	if body.is_in_group("PL"):
		anim.play("coll")
func _on_animated_sprite_2d_animation_finished():
	if anim.animation == "coll":
		t = true
		queue_free()
