extends Node # instancia a classe Node2D

var status = 1

#A variável “status” pode assumir dois valores: 1 e 0.
#Quando assume o valor 1, o jogo começa já funcionando. 
#Quando assume o valor 0, é como se o jogo reiniciasse e para funcionar é preciso pressionar enter. 
#(outros valores fazem com que o jogo não funcione).

var vscore = 0

#A variável “vscore” assume os valores da primeira pontuação, ao passar pela primeira árvore.
#Pode assumir valores inteiros ou quebrados.
#Quando assume o valor 1, o score do jogo começa na pontuação 0, ao passar pela primeira árvore, o score assume o valor 2.
#Quando assume o valor 0, o score do jogo começa na pontuação 0, ao passar pela primeira árvore, o score assume o valor 1.
#Quando assume o valor 8, o score do jogo começa na pontuação 0, ao passar pela primeira árvore, o score assume o valor 9.
#Quando assume o valor 7.5, o score do jogo começa na pontuação 0, ao passar pela primeira árvore, o score assume o valor 8.5
#Ao continuar o jogo, a cada árvore passada, o score aumenta 1 número inteiro em relação ao anterior.

var x = 1.5

#A variável "x" assume os valores da velocidade e direção horizontal do movimento do dragão.
#Pode assumir valores inteiros ou quebrados.
#Para valores positivos o dragão anda para frente, para valores negativos o dragão anda para trás.
#(controla o eixo da abiscissa do dragão)

#obs: para o dragão se mover mais rápido, essa é a variável em que temos que modificar o valor.

var y = 1.5

#A variável "y" assume os valores da "gravidade" e direção vertical do movimento do dragão.
#Pode assumir valores inteiros ou quebrados.
#Para valores positivos o dragão tende para baixo, para valores negativos o dragão tende para cima.
#(controla o eixo da ordenada do dragão)


# executa essa função ao carregar o jogo
func _ready():
	# oculta o "gameover"
	$gameover.hide()


# executa essa função a cada frame (60 FPS)
func _process(delta):
	
	if status == 1: # jogando
		
		# movimenta o cenário do fundo
		$background.position.x -= 1*x
		if ($background.position.x) < -200:
			$background.position.x = 600
			
		# movimenta as colunas para colisão
		$columns.position.x -= 2*x
		if ($columns.position.x) < -550:
			$columns.position.x = rand_range(0, 350) - 50
			$columns.position.y = rand_range(0, 400) - 200
		
		# puxa o dragão para baixo
		$dragon.position.y += y

		# se bateu no fundo, não desce mais e termina o jogo
		if $dragon.position.y > 480:
			$dragon.position.y = 480
			status = 0 # muda o status para "parado"

		# se bateu no teto, não sobe mais
		if $dragon.position.y < -20:
			$dragon.position.y = -20
			
		# se apertou seta para baixo, aumenta o valor de y (posição vertical) do dragão
		if Input.is_action_pressed("ui_down"):
			$dragon.position.y += 2

		# se apertou seta para cima, diminui o valor de y (posição vertical) do dragão
		if Input.is_action_pressed("ui_up"):
			$dragon.position.y -= 4
			
	elif status == 0: # parado
		
		$dragon/dragonImages.playing = false # faz dragão parar de bater as asas
		$gameover.show() # exibe imagem gameover

		# se apertou enter ou space, recomeça o jogo
		if Input.is_action_pressed("ui_accept"):
			$score.set_text("0") # zera o score
			vscore = 0 # zera o score
			status = 1 # muda o status para "jogando"
			$dragon/dragonImages.playing = true # faz dragão voltar a bater as asas
			$dragon.position.y = 0 # volta o dragão para a posição original
			$columns.position.x = 400 # muda a posição das colunas
			$gameover.hide() # oculta o gameover

			

# executa essa função quando o dragão bate na coluna
func _on_columns_body_shape_entered(body_id, body, body_shape, local_shape):
	if (local_shape < 2): # esse node tem 3 shapes de colisão: 0 e 1 são as colunas
		status = 0 # muda o status para "parado"

# executa essa função quando o dragão atravessa entre as colunas
func _on_columns_body_shape_exited(body_id, body, body_shape, local_shape):
	if (local_shape == 2): # esse node tem 3 shapes de colisão: 0 e 1 são as colunas
		vscore += 1 # aumenta o score
		$score.set_text(str(vscore)) # atualiza o painel
		

