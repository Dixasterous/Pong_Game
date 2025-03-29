extends Control


@onready var winner_label: Label = $VBoxContainer/WinnerLabel



func _ready() -> void:
    if GameManager.player1score == 7:
        winner_label.text = "Player One wins"
    elif GameManager.player2score == 7:
        winner_label.text = "Player Two wins" 





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
    pass


func _on_back_pressed() -> void:
    get_tree().change_scene_to_file("res://Scenes/menu.tscn")
