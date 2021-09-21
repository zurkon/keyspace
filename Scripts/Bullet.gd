extends Area2D


var _current_index := 0
var _target_prompt := ""
var _velocity := Vector2(1, 0)
var _speed := 250.0


func _physics_process(delta: float) -> void:
	global_position += _velocity.rotated(rotation) * _speed * delta


func set_current_index(value: int) -> void:
	_current_index = value


func get_current_index() -> int:
	return _current_index


func set_target_prompt(target: String) -> void:
	_target_prompt = target


func get_target_prompt() -> String:
	return _target_prompt


func _on_Bullet_body_entered(body: Node2D) -> void:
	if body.get_groups().has("Enemy"):
		if body.get_prompt() == _target_prompt:
			body.set_next_character(_current_index)
			queue_free()
