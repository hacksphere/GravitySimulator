#@codekit-prepend Vector.coffee

gravitationalConstant = 3

class Vector
	constructor: (@x, @y) ->

	add: (other) ->
		@x += other.x
		@y += other.y

	dist: (other) ->
		dx = other.x - @x
		dy = other.y - @y

		Math.sqrt dx * dx + dy * dy

	length: ->
		Math.sqrt @x * @x + @y * @y

	scaleTo: (newLength) ->
		@mult (newLength / @length())
		this

	mult: (ratio) ->
		@x *= ratio
		@y *= ratio

subtract = (vector1, vector2) ->
	new Vector vector1.x - vector2.x, vector1.y - vector2.y

class GameObject
	constructor: ->

	run: ->

	show: ->

class Planet extends GameObject
	constructor: ->
		super

		border = canvas.height / 4
		@loc = new Vector random(border, canvas.width - border), random(border, canvas.height - border)

		#@vel = new Vector random(-1, 1), random(-1, 1)
		@vel = new Vector 0, 0

		@radius = 10

		@mass = 1

	run: ->
		super

		for planet in gameObjects
			dist = @loc.dist(planet.loc)

			#console.log dist

			if dist != 0 and not isNaN(dist)
				force = gravitationalConstant * @mass * planet.mass / Math.pow(dist, 2)
				direction = subtract(planet.loc, @loc)
				accelerationAmount = force / @mass

				if dist < @radius + planet.radius
					accelerationAmount *= -1

				@vel.add(direction.scaleTo(accelerationAmount))

		@loc.add(@vel)

	show: ->
		super

		context.fillStyle = rgb 255, 200, 200
		context.rect @loc.x, @loc.y, 1000, 1000