extends Area2D





func _on_body_entered(body):
	if body.is_in_group("PL"):
		body.l_pos = true
	pass # Replace with function body.
