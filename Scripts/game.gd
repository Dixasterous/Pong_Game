extends Node2D


@onready var ball: CharacterBody2D = $Ball
@onready var timer: Timer = $Timer
@onready var score_player_1: Label = $ScorePlayer1
@onready var score_player_2: Label = $ScorePlayer2




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    reset_scene()
    score_player_1.text = str(0)
    score_player_2.text = str(0)
    ball.spawn_ball() # Replace with function body.
    timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    if GameManager.player1score == 7 or GameManager.player2score == 7:
        get_tree().change_scene_to_file("res://Scenes/winner.tscn")
        

func reset_scene():
    GameManager.player1score = 0  # Reset player 1 score
    GameManager.player2score = 0  # Reset player 2 score
    score_player_1.text = str(GameManager.player1score)  # Update UI
    score_player_2.text = str(GameManager.player2score)  # Update UI
    #ball.position = Vector2(100, 100)  # Reset ball position or other game elements
    #ball.linear_velocity = Vector2.ZERO  # Stop ball movement
    timer.start(3)  # Start the timer if needed
        



func _on_timer_timeout() -> void:
    ball.spawn_ball()
    timer.stop()





func _on_score_left_area_ball_scored_left() -> void:
    GameManager.player1score += 1
    score_player_1.text = str(GameManager.player1score)
    timer.start(3)
    

func _on_score_right_area_ball_scored_right() -> void:
    GameManager.player2score += 1
    score_player_2.text = str(GameManager.player2score)
    timer.start(3)
