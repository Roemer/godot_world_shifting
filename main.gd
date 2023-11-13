extends Node3D

# Handle World Shifting
# https://www.reddit.com/r/godot/comments/typb9y/making_the_world_move_around_the_player/
# https://github.com/Tobalation/Godot-floating-origin/tree/main

# Amount of distance before shifting
@export var threshold : float = 4.0

# Reference to main camera
@export var camera: Camera3D

# Function to contain origin shift logic
func shift_origin() -> void:
	# Shift everything by the offset of the camera's position
	global_transform.origin -= camera.global_transform.origin
	print("World shifted to " + str(global_transform.origin))

func _physics_process(delta: float) -> void:
	# Check distance of world from camera and shift if greater than threshold
	if(camera.global_transform.origin.length() > threshold && camera != null):
		shift_origin()
