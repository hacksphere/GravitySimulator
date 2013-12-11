#@codekit-prepend helperFunctions.coffee
#@codekit-prepend planet.coffee

$ = jQuery

root = exports ? this

#Get the canvas
#---------------
canvas = document.getElementById "myCanvas"
context = canvas.getContext "2d"

gameObjects = []

computeNextTimestep = ->
	context.fillStyle = rgb 0, 0, 0
	context.fillRect 0, 0, 10000, 10000

	for gameObject in gameObjects
		gameObject.run()

	for gameObject in gameObjects
		gameObject.show()

		context.fillStyle = rgb 100, 100, 100

		context.beginPath()
		context.arc gameObject.loc.x, gameObject.loc.y, gameObject.radius, 0, 2*Math.PI
		context.closePath()
		context.fill()


	setTimeout(computeNextTimestep, 0)

canvas.width = window.innerWidth
canvas.height = window.innerHeight

for i in [0..10]
	gameObjects.push(new Planet())

computeNextTimestep()