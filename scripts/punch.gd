extends Area3D

@export var force := 20.0

func _on_body_entered(body):
    if body is CharacterBody3D:
        var dir = (body.global_position - global_position).normalized()
        body.velocity += dir * force
        body.velocity.y = 6