extends CanvasLayer

@onready var anim : AnimationPlayer = $AnimationPlayer

func change_scene(index):
	anim.play("fade")
	await  anim.animation_finished
	get_tree().change_scene_to_file(str(index))
	anim.play_backwards("fade")
	await  anim.animation_finished

func EXIT():
	anim.play("fade")
	await  anim.animation_finished
	get_tree().quit()
	anim.play_backwards("fade")
	await  anim.animation_finished
