extends Node2D

@onready var _animated_sprite = $AnimatedSprite2D
func _ready():
	_animated_sprite.play("gatos")
	$AudioStreamPlayer.play()
func _process(_delta):
	pass

func _on_button_pressed() -> void:
	Laranja.multiplayerz = false
	get_tree().change_scene_to_file("res://jogo.tscn")
func _on_button_2_pressed() -> void:
	Laranja.multiplayerz = true
	get_tree().change_scene_to_file("res://jogo.tscn")

func _on_button_3_pressed() -> void:
	get_tree().quit()
