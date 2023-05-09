extends Node2D

var pbvert:ProgressBar
var pbhor:ProgressBar
var pbhor2:ProgressBar
var pbstyle:StyleBoxFlat
var text_edit:TextEdit
var panel2:Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# control panel build:
	var panel = Panel.new()
	panel.set_position(Vector2(20,60))
	panel.set_size(Vector2(150,200))
	add_child(panel)
	
	var link_button = LinkButton.new()
	link_button.set_position(Vector2(10, 10))
	link_button.set_size(Vector2(110,50))
	link_button.text = "pyfryday.itch.io"
	link_button.connect("pressed", self._open_link)
	panel.add_child(link_button)
	
	var cb_change_bars = CheckButton.new()
	cb_change_bars.set_position(Vector2(10, 40))
	cb_change_bars.set_size(Vector2(10, 20))
	cb_change_bars.text = "change bars"
	cb_change_bars.connect("toggled", self._on_change_bars)
	panel.add_child(cb_change_bars)
	
	var cb_show_percent = CheckButton.new()
	cb_show_percent.set_position(Vector2(10,70))
	cb_show_percent.set_size(Vector2(10,20))
	cb_show_percent.text = "show %"
	cb_show_percent.connect("toggled", self._on_show_percent)
	panel.add_child(cb_show_percent)
	
	# color picker section:
	var lblcpk = Label.new()
	lblcpk.text = "select bar color:"
	lblcpk.set_position(Vector2(10,120))
	lblcpk.set_size(Vector2(120,20))
	panel.add_child(lblcpk)
	
	var colorpicker
	colorpicker = ColorPickerButton.new()
	colorpicker.set_position(Vector2(10, 150))
	colorpicker.set_size(Vector2(120,20))
	colorpicker.connect("color_changed", self._color_changed)
	colorpicker.text = "select bar color"
	panel.add_child(colorpicker)
	
	#second panel for progress bars:
	pbstyle = StyleBoxFlat.new() # Create instance of Progress Bar style to be used
	
	panel2 = Panel.new()
	panel2.set_position(Vector2(340, 60))
	panel2.set_size(Vector2(400,225))
	add_child(panel2)
	
	pbvert = ProgressBar.new()
	pbvert.set_position(Vector2(10,10))
	pbvert.set_size(Vector2(50,200))
	pbvert.set_value_no_signal(65)
	pbvert.fill_mode = 3 # start with vert. bottom-to-top
	pbvert.show_percentage = false
	panel2.add_child(pbvert)
	
	pbhor = ProgressBar.new()
	pbhor.set_position(Vector2(80,10))
	pbhor.set_size(Vector2(310,50))
	pbhor.set_value_no_signal(25)
	pbhor.fill_mode = 0 # start with horiz. left-to-right
	pbhor.show_percentage = false
	panel2.add_child(pbhor)
	
	pbhor2 = ProgressBar.new()
	pbhor2.set_position(Vector2(80,70))
	pbhor2.set_size(Vector2(310,50))
	pbhor2.set_value_no_signal(75)
	pbhor2.fill_mode = 1 # start with horiz. right-to-left
	pbhor2.show_percentage = false
	panel2.add_child(pbhor2)
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _open_link():
	OS.shell_open("https://pyfryday.itch.io")
	pass

func _color_changed(clr):
	pbstyle.bg_color = clr
	pbvert.add_theme_stylebox_override("fill",pbstyle)
	pbhor.add_theme_stylebox_override("fill",pbstyle)
	pbhor2.add_theme_stylebox_override("fill",pbstyle)
	pass

func _on_change_bars(v):
	if pbvert.fill_mode == 3:
		pbvert.fill_mode = 2
	elif pbvert.fill_mode == 2:
		pbvert.fill_mode = 3
	
	if pbhor.fill_mode == 0:
		pbhor.fill_mode = 1
	elif pbhor.fill_mode == 1:
		pbhor.fill_mode = 0
	
	if pbhor2.fill_mode == 1:
		pbhor2.fill_mode = 0
	elif pbhor2.fill_mode == 0:
		pbhor2.fill_mode = 1
	pass

func _on_show_percent(v):
	if pbvert.show_percentage:
		pbvert.show_percentage = false
	else:
		pbvert.show_percentage = true
	
	if pbhor.show_percentage:
		pbhor.show_percentage = false
	else:
		pbhor.show_percentage = true
		
	if pbhor2.show_percentage:
		pbhor2.show_percentage = false
	else:
		pbhor2.show_percentage = true
	
