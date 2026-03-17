extends Node3D

func _process(delta):
    if global_position.y < -10:
        queue_free()