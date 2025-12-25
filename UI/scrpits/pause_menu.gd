extends Control

@onready var anim = $AnimationPlayer

var paused : bool = false

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
		paused = true
		visible = true
		mouse_filter = Control.MOUSE_FILTER_STOP
	elif Input.is_action_just_pressed("pus") and get_tree().paused:
		con()
		paused = false
		visible = false
		mouse_filter = Control.MOUSE_FILTER_IGNORE

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
	mouse_ignore()

func mouse_ignore():
	for b in get_children():
		if b is TextureButton:
			b.disabled = paused
