extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text("World: %.2f %.2f %.2f\nCamera Local: %.2f %.2f %.2f\nCamera Global: %.2f %.2f %.2f" % [
		get_parent().global_transform.origin.x, get_parent().global_transform.origin.y, get_parent().global_transform.origin.z,
		get_parent().get_node("Camera3D").transform.origin.x, get_parent().get_node("Camera3D").transform.origin.y, get_parent().get_node("Camera3D").transform.origin.z,
		get_parent().get_node("Camera3D").global_transform.origin.x, get_parent().get_node("Camera3D").global_transform.origin.y, get_parent().get_node("Camera3D").global_transform.origin.z
	])
