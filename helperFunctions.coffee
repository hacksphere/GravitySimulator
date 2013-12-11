#hsl doesn't seem to work :(
rgb = (r, g, b) ->
	"rgb(" + r + "," + g + "," + b + ")"
rgba = (r, g, b, a) ->
	"rgba(" + r + "," + g + "," + b + "," + a + ")"

random = (minimum, maximum) ->
	return minimum + Math.random() * (maximum - minimum)