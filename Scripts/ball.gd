extends CharacterBody2D

var direction = Vector2.ZERO
var win_size : Vector2
@export var START_SPEED = 500
@export var ACCEL = 50
@export var speed : int

func _ready() -> void:
    win_size = get_viewport_rect().size


func spawn_ball():
    position.x = win_size.x / 2
    position.y = randi_range(200,win_size.y - 200)
    speed = START_SPEED
    direction = random_dir()



func random_dir() -> Vector2:
    var dir = Vector2.ZERO
    dir.x = [1,-1].pick_random()
    dir.y = randf_range(-1,1)
    return dir.normalized()


func _physics_process(delta: float) -> void:
    var collision = move_and_collide(direction * speed * delta)

    if collision:
        var collider = collision.get_collider()
        direction = direction.bounce(collision.get_normal())
        
        if collider.name == "Player1":
            speed += ACCEL
