extends Node2D


export var bullet_speed := 100.0


var bullet := preload("res://Scenes/Bullet.tscn")


func fire(target: KinematicBody2D, index_value: int) -> void:
	var bullet_instance = bullet.instance()
	bullet_instance.position = $Position2D.global_position
	bullet_instance.set_current_index(index_value)
	get_parent().add_child(bullet_instance)
	bullet_instance.look_at(target.get_global_position())
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(bullet_instance.rotation))
