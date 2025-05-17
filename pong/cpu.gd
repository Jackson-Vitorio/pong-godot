extends StaticBody2D

var ball_pos : Vector2
var dist : int
var move_by : int
var altura_janela : int
var altura_raquete : int


func _ready():
	altura_janela = get_viewport_rect().size.y
	altura_raquete = $ColorRect.get_size().y


func _process(delta):
	ball_pos = $"../Bola".position
	dist = position.y - ball_pos.y
	
	if abs(dist) > get_parent().velocidade_raquetes * delta:
		move_by = get_parent().velocidade_raquetes * delta * (dist / abs(dist))
	else:
		move_by = dist

	position.y -= move_by
	
	position.y = clamp(position.y, altura_raquete / 2, altura_janela - altura_raquete / 2)
