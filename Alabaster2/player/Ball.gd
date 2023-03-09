extends RigidBody

export var rollingForce = 40;
export var jumpHeight = 1000

#Forward and Back
export (NodePath) var CameraGimbal_path
onready var CameraGimbal = get_node(CameraGimbal_path)
var forward = Vector3.FORWARD

func _ready():
	$CameraGimbal.set_as_toplevel(true)
	$FloorCheck.set_as_toplevel(true)

func _physics_process(delta):
	var lastCamPos = $CameraGimbal.global_transform.origin
	var playerPos = global_transform.origin
	var newCamPos = lerp(lastCamPos, playerPos, 0.1)
	$CameraGimbal.global_transform.origin = newCamPos
	
	$FloorCheck.global_transform.origin = global_transform.origin
	
	forward = Vector3.FORWARD
	#For Up and Down
	var forward = (-CameraGimbal.global_transform.basis.z*Vector3(1,0,1)).normalized()
	#For Left and Right
	var side = (-CameraGimbal.global_transform.basis.x*Vector3(1,0,1)).normalized()
	
	if Input.is_action_pressed("forward"):
		apply_central_impulse(rollingForce*forward)
	elif Input.is_action_pressed("back"):
		apply_central_impulse(-rollingForce*forward)
	if Input.is_action_pressed("left"):
		apply_central_impulse(rollingForce*side)
	elif Input.is_action_pressed("right"):
		apply_central_impulse(-rollingForce*side)
	
	
	var onFloor = $FloorCheck.is_colliding()
	if Input.is_action_just_pressed("jump") and onFloor:
			apply_central_impulse(Vector3.UP*jumpHeight)
	
	
