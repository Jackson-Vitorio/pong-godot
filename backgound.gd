extends AnimatedSprite2D

@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	_animated_sprite.play("run")
	_animated_sprite.stop()
