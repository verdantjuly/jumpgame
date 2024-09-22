extends CharacterBody2D

var screen_size # 게임 창 크기
var gravity: float = 500
var speed: float = 400
var jump_force: float = 400

func _ready():
	screen_size = get_viewport_rect().size
	

func is_on_ground() -> bool:
	return is_on_floor()

func _physics_process(delta):

	var direction = Vector2.ZERO
			
	# 중력 적용
	if not is_on_ground():
		velocity.y += gravity * delta
		if global_position.y > 2000 :
			velocity.y = 0  # 속도 0으로 설정
			$Label.show()  # 게임 오버 메시지 표시
		else: 
			$Label.hide()
	
	else:
		velocity.y = 0  # 바닥에 있을 때 y축 속도를 0으로 고정

		# 점프
		if Input.is_action_just_pressed("jump_up"):
			velocity.y = -jump_force

	# 좌우 이동 처리
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1

	# 좌우 속도 적용
	velocity.x = direction.x * speed

	# move_and_slide 호출
	move_and_slide()







	
