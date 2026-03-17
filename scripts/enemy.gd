extends CharacterBody3D

@export var speed := 4.0
var target

func _ready():
    target = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
    if target:
        var dir = (target.global_position - global_position).normalized()
        velocity.x = dir.x * speed
        velocity.z = dir.z * speed
        move_and_slide()