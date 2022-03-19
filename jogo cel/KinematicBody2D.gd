extends KinematicBody2D

var motion = Vector2()
var posicao
func _physics_process(delta):
	#motion.y += 20
	pass


	
func descobrir_pos():
	pass
	if $".".position.x== 32 and $".".position.y== 32:
		posicao=1
		print(posicao)
	if $".".position.x== 96 and $".".position.y== 32:
		posicao=2
		print(posicao)
	if $".".position.x== 160 and $".".position.y== 32:
		posicao=3
		print(posicao)
	if $".".position.x== 32 and $".".position.y== 96:
		posicao=4
		print(posicao)
	if $".".position.x== 96 and $".".position.y== 96:
		posicao=5
		print(posicao)
	if $".".position.x== 160 and $".".position.y== 96:
		posicao=6
		print(posicao)	
	if $".".position.x== 32 and $".".position.y== 160:
		posicao=7
		print(posicao)
	if $".".position.x== 96 and $".".position.y==160:	
		posicao=8
		print(posicao)
	if $".".position.x== 160 and $".".position.y==160:	
		posicao=9
		print(posicao)

func deletar():
	var valorx=$".".position.x/32
	var valory=$".".position.y/32	
	print(valorx,",",valory)
	
