extends Position3D

export var rotate_speed = PI/2

func _physics_process(delta):
	#Rotate outer gimbal around y axis
	var y_rotate = 0
	if Input.is_action_pressed("cam_right"):
		y_rotate +=1
	if Input.is_action_pressed("cam_left"):
		y_rotate -=1
	rotate_object_local(Vector3.UP, y_rotate*rotate_speed*delta)
	#Rotate inner gimbal around local x axis
	var x_rotate = 0
	if Input.is_action_pressed("cam_up"):
		x_rotate +=1
	if Input.is_action_pressed("cam_down"):
		x_rotate -=1
	rotate_object_local(Vector3.RIGHT, x_rotate*rotate_speed*delta)
	#$InnerGimbal.rotate_object_local(Vector3.RIGHT, x_rotate*rotate_speed*delta)
	
#export (NodePath) var target
#
#export (float, 0.0, 2.0) var rotation_speed = PI/2
#
#func get_input_keyboard(delta):
#    # Rotate outer gimbal around y axis
#    var y_rotation = 0
#    if Input.is_action_pressed("cam_right"):
#        y_rotation += 1
#    if Input.is_action_pressed("cam_left"):
#        y_rotation += -1
#    rotate_object_local(Vector3.UP, y_rotation * rotation_speed * delta)
#    # Rotate inner gimbal around local x axis
#    var x_rotation = 0
#    if Input.is_action_pressed("cam_up"):
#        x_rotation += -1
#    if Input.is_action_pressed("cam_down"):
#        x_rotation += 1
#    x_rotation = -x_rotation if invert_y else x_rotation
#    $InnerGimbal.rotate_object_local(Vector3.RIGHT, x_rotation * rotation_speed * delta)
#
#func _process(delta):
#    if !mouse_control:
#        get_input_keyboard(delta)
#    $InnerGimbal.rotation.x = clamp($InnerGimbal.rotation.x, -1.4, -0.01)
#    scale = lerp(scale, Vector3.ONE * zoom, zoom_speed)
#    if target:
#        global_transform.origin = get_node(target).global_transform.origin
