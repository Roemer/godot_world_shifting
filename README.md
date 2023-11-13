# godot_world_shifting

A simple example with world shifting

It is a 3D scene containing:
- A spawner that makes sure that there are always some ground pieces to sit on and despawns them when out of sight
- The spawner also spawns a barrel every 2 seconds behind the player for physics testing
- A simple player that can be controlled with the arrow keys and jump with space
- A camera that continuously moves forward
- When the camera reaches a certain threshold, the global_transform is shifted to the camera

Thanks https://kenney.nl/ for the assets
