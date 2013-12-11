class Vector
	constructor: (@x, @y) ->

	add: (other) ->
		@x += other.x
		@y += other.y