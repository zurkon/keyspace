extends RigidBody2D


var _current_index := 0


func set_current_index(value: int) -> void:
	_current_index = value


func get_current_index() -> int:
	return _current_index


func _on_Bullet_body_entered(body: Node2D) -> void:
#	print("bullet index: %d" % _current_index)
#	print(body.get_groups())
	if body.get_groups().has("Enemy"):
		body.set_next_character(_current_index)
		queue_free()
