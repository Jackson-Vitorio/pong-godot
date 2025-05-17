extends AnimatedSprite2D

@onready var _animated_sprite = $AnimatedSprite2D

func _ready():
	_animated_sprite.play("background_dos_gatos")
