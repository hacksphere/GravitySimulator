$ = jQuery

$ ->
	($ "canvas").click ( (event) ->
		gameObjects.push new Planet new Vector event.clientX-canvas.width/2, event.clientY-canvas.height/2
		)

	#Speed buttons
	($ "#slow").click ->
		root.delay = 100
	($ "#medium").click ->
		root.delay = 1
	($ "#fast").click ->
		root.delay = 0

	#Drag buttons	
	($ "#noDrag").click ->
		root.drag = 0
	($ "#lowDrag").click ->
		root.drag = .01
	($ "#highDrag").click ->
		root.drag = .1

	#power buttons	
	($ "#power1").click ->
		root.power = 1
	($ "#power2").click ->
		root.power = 2
	($ "#power3").click ->
		root.power = 3

	#Set settings
	($ "#fast").click()
	($ "#noDrag").click()