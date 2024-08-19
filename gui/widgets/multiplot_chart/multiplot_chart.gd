extends Control

@onready var chart: Chart = $VBoxContainer/Chart

# This Chart will plot 3 different functions
var f1: Function

func plot_points(voltages):
	for n in voltages.size():
		f1.add_point(n + 1, voltages[n])
		chart.queue_redraw()

func reset_chart():
	f1.__x = [0, 1000, 2000, 3000, 4000, 5000]
	f1.__y = [-1000, -1000, -1000, -1000, -1000, -1000]
	chart.queue_redraw()

func _ready():
	# Let's create our @x values
	#var x: Array = ArrayOperations.multiply_float(range(-10, 11, 1), 0.5)
	var x: Array = [0, 1000, 2000, 3000, 4000, 5000]
	
	# And our y values. It can be an n-size array of arrays.
	# NOTE: `x.size() == y.size()` or `x.size() == y[n].size()`
	#var y: Array = ArrayOperations.multiply_int(ArrayOperations.cos(x), 20)
	var y: Array = [1000, 1000, 1000, 1000, 1000, 1000]
	
	# Let's customize the chart properties, which specify how the chart
	# should look, plus some additional elements like labels, the scale, etc...
	var cp: ChartProperties = ChartProperties.new()
	cp.colors.frame = Color.TRANSPARENT
	cp.colors.background = Color.TRANSPARENT
	cp.colors.grid = Color("#283442")
	cp.colors.ticks = Color("#283442")
	cp.colors.text = Color.WHITE_SMOKE
	cp.draw_bounding_box = false
	#cp.show_legend = true
	cp.title = "Wavelengths Chart"
	cp.x_label = "Time (800 n/s)"
	cp.y_label = "Voltage (mV)"
	cp.x_scale = 5
	cp.x_scale_type = 1
	cp.y_scale = 6
	cp.interactive = true # false by default, it allows the chart to create a tooltip to show point values
	cp.max_samples = 5000
	# and interecept clicks on the plot
	
	# Let's add values to our functions
	f1 = Function.new(
		x, y, "Wavelength", # This will create a function with x and y values taken by the Arrays 
						# we have created previously. This function will also be named "Pressure"
						# as it contains 'pressure' values.
						# If set, the name of a function will be used both in the Legend
						# (if enabled thourgh ChartProperties) and on the Tooltip (if enabled).
		# Let's also provide a dictionary of configuration parameters for this specific function.
		{ 
			color = Color("#36a2eb"), 		# The color associated to this function
			marker = Function.Marker.NONE, 	# The marker that will be displayed for each drawn point (x,y)
											# since it is `NONE`, no marker will be shown.
			type = Function.Type.AREA, 		# This defines what kind of plotting will be used, 
											# in this case it will be an Area Chart.
			interpolation = Function.Interpolation.LINEAR	# Interpolation mode, only used for 
															# Line Charts and Area Charts.
		}
	)
	
	# Now let's plot our data
	chart.plot([f1], cp)
	
	# Uncommenting this line will show how real time data plotting works
	set_process(false)


var new_val: float = 4.5

func _process(delta: float):
	# This function updates the values of a function and then updates the plot
	new_val += 5
	
	# we can use the `Function.add_point(x, y)` method to update a function
	f1.add_point(new_val, cos(new_val) * 20)
	chart.queue_redraw() # This will force the Chart to be updated


func _on_CheckButton_pressed():
	set_process(not is_processing())
