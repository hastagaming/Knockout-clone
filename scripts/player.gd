extends CharacterBody3D

@export var speed := 6.0
@export var jump_force := 6.5

var gravity := ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):

    if not is_on_floor():
        velocity.y -= gravity * delta

    var input_dir = Vector3.ZERO
    input_dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    input_dir.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

    var direction = transform.basis * input_dir.normalized()

    if direction:
        velocity.x = direction.x * speed
        velocity.z = direction.z * speed
    else:
        velocity.x = move_toward(velocity.x, 0, speed)
        velocity.z = move_toward(velocity.z, 0, speed)

    move_and_slide()