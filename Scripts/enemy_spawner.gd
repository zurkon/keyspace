extends Node2D


onready var timer := $SpawnTimer
onready var enemy_container := $EnemyContainer


var _word_list = WordList.new()
var _enemy := preload("res://Scenes/Enemy.tscn")
var _positions := []
var _player: Node2D


func _ready() -> void:
	_player = get_parent().get_node("Player")
	randomize()
	_positions = [
		$LeftCorner,
		$Left,
		$Middle,
		$Right,
		$RightCorner
	]
	timer.start()


func spawn_new_enemy() -> void:
	var new_word: String = _word_list.get_random_word()
	print("Palavra selecionada: %s" % new_word)
	var enemy_instance = _enemy.instance()
	enemy_instance.global_position = _positions[ randi() % 5 ].global_position
	enemy_container.add_child(enemy_instance)
	enemy_instance.set_target(_player.global_position)
	enemy_instance.get_node("Sprite").look_at( _player.global_position )
	enemy_instance.get_node("Sprite").rotation_degrees -= 90
	enemy_instance.set_prompt(new_word)


func _on_SpawnTimer_timeout() -> void:
	spawn_new_enemy()
	timer.wait_time = rand_range( 2, 4 )
	timer.start()
