extends StaticBody2D



func _on_area_2d_body_entered(body):
	if body.is_in_group("PL"):
		body.global_position = body.respone_pos
	pass # Replace with function body.
