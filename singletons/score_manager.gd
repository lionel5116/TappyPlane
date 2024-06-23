extends Node

var _score: int = 0
var _high_scrore: int = 0

func get_score() -> int:
	return _score
	
func get_high_score() -> int:
	return _high_scrore

func set_score(v:int) -> void:
	_score = v
	print("set_score ", _score)
	if _score > _high_scrore:
		_high_scrore = _score
		print("new_high_score ", _high_scrore)
	
	#this is emmited as a signal (see hud.gd) to draw text, takes care of drawing text every frame
	#we only want to draw text when increment_score() is called in pipes.gd script when there is a 
	#collision
	SignalManager.on_score_updated.emit()

func increment_score() -> void:
	set_score(_score + 1)
