extends Control

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("RESET")

func con():
	get_tree().paused = false
	anim.play_backwards("fade")
	

func pus():
	get_tree().paused = true
	anim.play("fade")

func testEec():
	if Input.is_action_just_pressed("pus") and !get_tree().paused:
		pus()
	elif Input.is_action_just_pressed("pus") and get_tree().paused:
		con()

func _on_continue_pressed():
	con()


func _on_new_game_pressed():
	con()
	get_tree().reload_current_scene()


func _on_main_menu_pressed():
	anim.play_backwards("fade")
	await anim.animation_finished
	get_tree().paused = false
	Transions.change_scene("res://UI/enter_face.tscn")
	pass # Replace with function body.

func _physics_process(_delta):
	testEec()
