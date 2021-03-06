extends Node2D


export var bullet_speed := 300.0


var _bullet := preload("res://Scenes/Bullet.tscn")


func fire(target: KinematicBody2D, index_value: int, prompt: String) -> void:
	var bullet_instance = _bullet.instance()
	bullet_instance.position = $Position2D.global_position
	bullet_instance.set_current_index(index_value)
	bullet_instance.set_target_prompt(prompt)
	get_parent().add_child(bullet_instance)
	bullet_instance.look_at(target.get_global_position())
