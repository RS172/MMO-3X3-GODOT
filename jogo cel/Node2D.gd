extends Node2D
var vida=10
var ataque=10
var vida_total=20
var x
var y
var SlimeAzul = preload("res://SlimeAzul.tscn")
var SlimeVerde = preload("res://SlimeVerde.tscn")
var SlimeVermelho = preload("res://SlimeVermelho.tscn")
var SlimeAmarelo = preload("res://SlimeAmarelo.tscn")
var Cobra = preload("res://Cobra.tscn")
var Minhoca = preload("res://Minhoca.tscn")
var Goblin = preload("res://Goblin.tscn")
var GoblinArmado = preload("res://GoblinArmado.tscn")
var Morcego = preload("res://Morcego.tscn")
var Pocao = preload("res://Pocao.tscn")
var Espada = preload("res://Espada.tscn")

func _ready():
	for x in 3:
		for y in 3:
			if x==1 and y==1:
				pass
			else:
				criar_mob1(x,y)

func _process(delta):
		if vida<1:
			$".".queue_free()
		else:
			if Input.is_action_just_pressed("ui_right"):
				if $KinematicBody2D.position.x==160:
					pass
				else:
					recriar($KinematicBody2D.position.x,$KinematicBody2D.position.y)
					$KinematicBody2D.position.x+=64
					
			elif Input.is_action_just_pressed("ui_left"):
				if $KinematicBody2D.position.x==32:
					pass
				else:
					recriar($KinematicBody2D.position.x,$KinematicBody2D.position.y)
					$KinematicBody2D.position.x-=64
					
			elif Input.is_action_just_pressed("ui_up"):
				if $KinematicBody2D.position.y==32:
					pass
				else:
					recriar($KinematicBody2D.position.x,$KinematicBody2D.position.y)
					$KinematicBody2D.position.y-=64

			elif Input.is_action_just_pressed("ui_down"):
				if $KinematicBody2D.position.y==160:
					pass
				else:
					recriar($KinematicBody2D.position.x,$KinematicBody2D.position.y)
					$KinematicBody2D.position.y+=64
		if vida_total<=10:
			vida=vida_total
			ataque=0
		elif vida_total>=20:
			vida_total=20
			ataque=10
		else:
			ataque=vida_total-10
			vida=10
		$KinematicBody2D/Ataque.set_text(str(ataque))
		$KinematicBody2D/Vida.set_text(str(vida))	

func recriar(valorx,valory):
	if valorx==32:
		x=0
	if valorx==96:
		x=1
	if valorx==160:
		x=2
	if valory==32:
		y=0
	if valory==96:
		y=1
	if valory==160:
		y=2
	criar_mob1(x,y)
	pass

func criar_mob1(x,y):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var valor =rng.randi_range(1,1100)	
	if valor<=100:
		var mob=SlimeVerde.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>100 and valor<=200:
		var mob=Cobra.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>200 and valor<=300:
		var mob=Minhoca.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>300 and valor<=400:
		var mob=Goblin.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>400 and valor<=500:
		var mob=SlimeAzul.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>500 and valor<=600:
		var mob=SlimeVermelho.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>600 and valor<=700:
		var mob=SlimeAmarelo.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>700 and valor<=800:
		var mob=GoblinArmado.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>800 and valor<=900:
		var mob=Morcego.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>900 and valor<=1000:
		var mob=Pocao.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y
	elif valor>1000 and valor<=1100:
		var mob=Espada.instance()
		add_child(mob)
		(mob).position.x=32+64*x
		(mob).position.y=32+64*y

func _on_Area2D_area_entered(area):
	if area.name=="Cobra":
		vida_total-=2
	if area.name=="Goblin":
		vida_total-=4
	if area.name=="GoblinArmado":
		vida_total-=6
	if area.name=="Minhoca":
		vida_total-=3
	if area.name=="Morcego":
		vida_total-=2
	if area.name=="Slime":
		vida_total-=1
	if area.name=="Pocao":
		vida_total+=5
	if area.name=="Espada":
		vida_total+=3
