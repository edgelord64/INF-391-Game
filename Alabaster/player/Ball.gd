extends RigidBody

export var rollingForce = 40;
export var jumpHeight = 1000

func _ready():
	$CameraRig.set_as_toplevel(true)
	$FloorCheck.set_as_toplevel(true)

func _physics_process(delta):
	var lastCamPos = $CameraRig.global_transform.origin
	var playerPos = global_transform.origin
	var newCamPos = lerp(lastCamPos, playerPos, 0.1)
	$CameraRig.global_transform.origin = newCamPos
	
	$FloorCheck.global_transform.origin = global_transform.origin
	
	if Input.is_action_pressed("forward"):
		angular_velocity.x -=rollingForce*delta
	elif Input.is_action_pressed("back"):
		angular_velocity.x +=rollingForce*delta
	if Input.is_action_pressed("left"):
		angular_velocity.z +=rollingForce*delta
	elif Input.is_action_pressed("right"):
		angular_velocity.z -=rollingForce*delta

	var onFloor = $FloorCheck.is_colliding()
	if Input.is_action_just_pressed("jump") and onFloor:
			apply_central_impulse(Vector3.UP*jumpHeight)
