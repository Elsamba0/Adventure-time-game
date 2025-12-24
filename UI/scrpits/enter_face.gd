extends Control


func _on_play_pressed():
	Transions.change_scene("res://UI/levels.tscn")
	pass 


func _on_set_pressed():
	Transions.change_scene("res://UI/set.tscn")
	pass 


func _on_qiut_pressed():
	Transions.EXIT()
	pass
