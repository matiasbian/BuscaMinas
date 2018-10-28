extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var listaDeListaFilas = []

export var filas = 3
export var columnas = 4
export var minas = 4
onready var celda = preload("res://Prefabs/Celda.tscn")
onready var container = get_node("../CenterContainer/GridContainer")
func _ready():
	container.columns = columnas
	
	for i in range(filas*columnas):
		var celdis  = celda.instance()
		container.add_child(celdis)
		listaDeListaFilas.append(celdis)
	
	while (minas > 0):
		var celdis = listaDeListaFilas[rand_range(0,listaDeListaFilas.size() -1)].get_node("Button")
		if (!celdis.soyCoco):
			minas = minas -1
		celdis.soyCoco = true
		
		
	# Called when the node is added to the scene for the first time.
	# Initialization here

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
