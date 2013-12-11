#@codekit-prepend helperFunctions.coffee
#@codekit-prepend planet.coffee
#@codekit-prepend io.coffee

$ = jQuery

root = exports ? this

#Get the canvas
#---------------
canvas = document.getElementById "myCanvas"
context = canvas.getContext "2d"

gameObjects = []

computeNextTimestep = ->
	for gameObject in gameObjects
		gameObject.run()

	#Tanslate to the center
	context.save()
	context.translate canvas.width/2, canvas.height/2

	#black out the background
	context.fillStyle = rgba 0, 0, 0, 0.5
	context.fillRect -1000, -1000, 10000, 10000

	#Draw the gameobject
	for gameObject in gameObjects
		gameObject.show()

		context.fillStyle = rgb 100, 100, 100

		context.beginPath()
		context.arc gameObject.loc.x, gameObject.loc.y, gameObject.radius, 0, 2*Math.PI
		context.closePath()
		context.fill()

	context.restore()

	console.log root.drag

	setTimeout(computeNextTimestep, root.delay)

root.delay = 0
root.drag = 0
root.power = 2

canvas.width = window.innerWidth
canvas.height = window.innerHeight

for i in [0..10]
	gameObjects.push new Planet randomVector()

computeNextTimestep()