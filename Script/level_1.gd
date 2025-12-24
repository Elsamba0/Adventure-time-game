extends Node2D

@export var FG : Node2D

var can_win = false

func _physics_process(_delta):
	var fs = FG.get_child_count()
	for i in FG.get_children():
		if i.t:
			fs -= 1
	if fs == 0:
		can_win = true


func can_win_ ():
	return can_win
