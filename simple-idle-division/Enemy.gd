extends Node
class_name Enemy

#basic stats
var health: float = 100
var melee_damage: float = 10
var melee_range: float = 1.0
var melee_attack_speed: float = 1.0

var evasion: float = 1.0

#movement
var distance: float = 0.0
var movement_speed: float = 1.26
#var turn_rate: float = 1
#var movement_acceleration: float = 50.0
#var movement_speed: float = 3.5
#var size_diameter: float = 0.6

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	pass
