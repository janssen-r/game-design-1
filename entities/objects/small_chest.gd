extends Node2D

# use -1 for default value; multiple of the same item should be enumerated.
# Edit contents of inspector
@export var contents: Dictionary = {} # { "coin1: 5, "coin2": 10, "miniheart" : -1}
var OPEN_STATE = false
var regex = RegEx.new()

func in_range(player) -> bool:
		return player.data.state != player.STATES.DEAD and \
			$StaticBody2D/Area2D.overlaps_body(player)
			
			
