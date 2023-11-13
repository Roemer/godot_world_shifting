extends Node3D

@export var camera: Camera3D
@export var player: Node3D

@onready var floorPacked = preload("res://floor.tscn")
@onready var barrelPacked = preload("res://barrel.tscn")

var terrain: Array[Node3D] = []
var barrels: Array[Node3D] = []
var num_terrain_pieces = 3
var scroll_velocity = .5
var barrel_timer : Timer = Timer.new()

func _ready():
	# Create the initial terrain
	for row in num_terrain_pieces:
		var new_terrain_block = floorPacked.instantiate()
		new_terrain_block.position = Vector3(0, 0, -5 + row * 3)
		add_child(new_terrain_block)
		terrain.append(new_terrain_block)
		
	# Initialize the timer for spawning barrels
	barrel_timer.wait_time = 2.0
	barrel_timer.timeout.connect(_barrel_timer_process)
	add_child(barrel_timer)
	barrel_timer.start()

func _physics_process(delta: float):
	# Add terrain blocks if needed
	if len(terrain) < num_terrain_pieces:
		var new_terrain_block = floorPacked.instantiate()
		var last_block_z_pos = terrain[0].position.z
		new_terrain_block.position = Vector3(0, 0, last_block_z_pos - 3)
		add_child(new_terrain_block)
		terrain.insert(0, new_terrain_block)
	
	camera.position.z -= scroll_velocity * delta
	
	# Check if a terrain block is out of sight
	for terrain_block in terrain:
		# Determine if the row is out of sight and remove it in that case
		if terrain_block.position.z > camera.position.z:
			print("terrain block erased")
			terrain.erase(terrain_block)
			terrain_block.queue_free()

func _barrel_timer_process():
	var new_barrel = barrelPacked.instantiate()
	new_barrel.position = player.position + Vector3(0, 1, -1)
	add_child(new_barrel)
