extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var listaDeListaFilas = []
var PrimerMov = true

export var filas = 5
export var columnas = 5
export var minas = 8
onready var celda = preload("res://Prefabs/Celda.tscn")
onready var container = get_node("/root/Node2D/CenterContainer/GridContainer")
func _ready():
	randomize()
	container.columns = columnas
	for i in range (filas):
		for j in range(columnas):
			var celdis  = celda.instance()
			celdis.get_node("Button").indice = Vector2(i,j)
			container.add_child(celdis)
			listaDeListaFilas.append(celdis)

		
		
	# Called when the node is added to the scene for the first time.
	# Initialization here

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func colocoMinas(celdaTranka):
	while (minas > 0):
		var celdis = listaDeListaFilas[rand_range(0,listaDeListaFilas.size() -1)].get_node("Button")
		if (!celdis.soyCoco and celdis.indice != celdaTranka):
			minas = minas -1
			celdis.soyCoco = true
			PrimerMov = false
		
