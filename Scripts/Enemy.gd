extends KinematicBody2D


export var target_color := Color("#ff5722")
export var letter_color := Color("#b71c1c")


onready var prompt = $RichTextLabel


var _origin_point := Vector2.ZERO
var _speed := 4
var _prompt_text := ""


func _ready() -> void:
	_origin_point = global_position
#	_speed = rand_range(50, 150)


func _physics_process(delta) -> void:
	var _velocity = move_and_slide( (Vector2( 80, 248 ) - _origin_point) * _speed  * delta )


func get_prompt() -> String:
	return _prompt_text


func set_prompt(text: String) -> void:
	_prompt_text = text
	prompt.parse_bbcode("[center]" + text + "[/center]")


func set_next_character(next_character_index: int) -> void:
	var target_text = get_color_tag(target_color) + _prompt_text.substr(next_character_index, _prompt_text.length()) + get_end_color_tag()
	prompt.parse_bbcode("[center]" + target_text + "[/center]")
	if next_character_index == _prompt_text.length():
		queue_free()


func get_color_tag(color: Color) -> String:
	return "[color=#" + color.to_html(false) + "]"


func get_end_color_tag() -> String:
	return "[/color]"


func _on_Enemy_tree_exiting() -> void:
	print("Destroyed!!!!")
