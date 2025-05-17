extends StaticBody2D

var altura_janela : int 
var altura_raquete : int

func _ready():
	altura_janela = get_viewport_rect().size.y
	altura_raquete = $ColorRect.get_size().y
	
func _process(delta):
	if Input.is_action_pressed("cima"):
		position.y -= get_parent().velocidade_raquetes * delta
	elif Input.is_action_pressed("baixo"):
		position.y += get_parent().velocidade_raquetes * delta
	position.y = clamp(position.y, altura_raquete / 2, altura_janela - altura_raquete /2)
