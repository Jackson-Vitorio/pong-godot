extends Sprite2D
var p := [0, 0]
const velocidade_raquetes : int = 500 
@onready var player2 = $Player2
@onready var cpu = $CPU 
func _ready():
	if Laranja.multiplayerz:
		configurar_multiplayer()
	else:
		configurar_single_player()


func configurar_multiplayer():
	cpu.visible = false
	cpu.set_process(false)
	player2.visible = true
	player2.set_process(true)

func configurar_single_player():
	player2.visible = false
	player2.set_process(false)
	cpu.visible = true
	cpu.set_process(true)

func _on_timer_timeout() -> void:
	$Bola.nova_bola()
func _on_esquerda_body_entered(body: Node2D) -> void:
	p[1] += 1
	$"../HUD/CPU".text = str(p[1])
	$"../Timer".start()
	if str(p[1]) == "5":
		fim(0)
func _on_direita_body_entered(body: Node2D) -> void:
	p[0] += 1
	$"../HUD/pontos player 1".text = str(p[0])
	$"../Timer".start()
	if str(p[0]) == "5":
		fim(1)
func fim(p):
	if str(p) == "0":
		$"../HUD/CPU".text = str(0)
		$"../HUD/pontos player 1".text = str(0)
		get_tree().change_scene_to_file("res://node_2d.tscn")
	else:
		$"../HUD/CPU".text = str(0)
		$"../HUD/pontos player 1".text = str(0)
		get_tree().change_scene_to_file("res://node_2d.tscn")
