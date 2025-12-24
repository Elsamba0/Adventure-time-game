extends Control

@onready var anim : AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("anim");
	pass


func _on_back_pressed():
	Transions.change_scene("res://UI/enter_face.tscn")
