extends Button
var soyCoco = false
var indice = 0
var minasCerca = 0
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("button_down",self,"clickAction")
	
	


func clickAction():
	if (soyCoco):
		print("Coco" + str(indice.x) + "," + str(indice.y))
		marcoMinas()
	else:
		if (Manag.PrimerMov):
			Manag.colocoMinas(indice)
		print("todoBien" + str(indice.x) + "," + str(indice.y))
		verificoMinasCercanas()
		self.text = str(minasCerca) 
		
func verificoMinasCercanas():
	verificoEnPosicion(Vector2(indice.x,indice.y-1) ) #arriba
	verificoEnPosicion(Vector2(indice.x,indice.y+1) ) #Abajo
	verificoEnPosicion(Vector2(indice.x-1,indice.y) ) #Izquierda
	verificoEnPosicion(Vector2(indice.x+1,indice.y) ) #Derecha
	verificoEnPosicion(Vector2(indice.x-1,indice.y-1) ) #DiagIzqArriba
	verificoEnPosicion(Vector2(indice.x-1,indice.y+1) ) #DiagIzqAbajo
	verificoEnPosicion(Vector2(indice.x+1,indice.y-1) ) #DiagDerArrriba
	verificoEnPosicion(Vector2(indice.x+1,indice.y+1) ) #DiagDerAbajo

	
func verificoEnPosicion(nroCelda):
	if ((nroCelda.x < 0 or nroCelda.x >= Manag.filas ) or (nroCelda.y < 0 or nroCelda.y >= Manag.columnas)):
		pass
	else:
		if (buscoEnLista(nroCelda).soyCoco):
			minasCerca += 1

func buscoEnLista(indice):
	for i in range (Manag.listaDeListaFilas.size()):
		if (Manag.listaDeListaFilas[i].get_node("Button").indice == indice):
			return Manag.listaDeListaFilas[i].get_node("Button")
func marcoMinas():
	for i in range (Manag.listaDeListaFilas.size()):
		if (Manag.listaDeListaFilas[i].get_node("Button").soyCoco):
			Manag.listaDeListaFilas[i].get_node("Button").text = "X"

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


