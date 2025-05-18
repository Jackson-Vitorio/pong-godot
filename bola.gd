extends CharacterBody2D


var tamanho_janela : Vector2
const velocidade_inicial : int = 500
const aceleracao : int = 50
var velocidade : int
var direcao : Vector2
const MAX_Y_VECTOR : float = 0.6


func _ready():
	tamanho_janela = get_viewport_rect().size

func nova_bola():
	position.x = tamanho_janela.x / 2
	position.y = randi_range(200, tamanho_janela.y - 200)
	velocidade = velocidade_inicial
	direcao = direcao_aleatoria()


func _physics_process(delta):
	var colisao = move_and_collide(direcao * velocidade * delta)
	var collider
	if colisao:
		collider = colisao.get_collider()

		if collider == $"../Player" or collider == $"../CPU":
			velocidade += aceleracao
			$"../../AudioStreamPlayer".play()
			direcao = nova_direcao(collider)

		else:
			direcao = direcao.bounce(colisao.get_normal())

func direcao_aleatoria():
	var nova_direcao := Vector2()
	nova_direcao.x = [1, -1].pick_random()
	nova_direcao.y = randf_range(-1, 1)
	return nova_direcao.normalized()

func nova_direcao(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var nova_direcao := Vector2()
	
	if direcao.x > 0:
		nova_direcao.x = -1
	else:
		nova_direcao.x = 1
	nova_direcao.y = (dist / (collider.altura_raquete / 2)) * MAX_Y_VECTOR
	return nova_direcao.normalized()
