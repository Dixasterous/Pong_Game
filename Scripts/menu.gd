extends Control




func _on_play_pressed() -> void:
    get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_credits_pressed() -> void:
    get_tree().change_scene_to_file("res://Scenes/credits_menu.tscn")


func _on_exit_pressed() -> void:
    get_tree().quit()
