extends RigidBody2D


var _current_index := 0
var _target_prompt := ""


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
		body.set_next_character(_current_index)
		queue_free()
