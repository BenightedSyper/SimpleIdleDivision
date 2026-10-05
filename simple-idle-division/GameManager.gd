extends Node2D
class_name GameManager

var game_clock: float = 0.0

var zone: int = 1
var distance: float = 0.0

var player_character: Player

var player_reload_timer: float = 0.0
var player_fire_rate_cooldown: float = 0.0

var enemy_array: Array[Enemy]

func _ready() -> void:
	#load character
	player_character = Player.new()
	#choose zone
	#spawn player
	#calculate monster spawns
	enemy_array.append(Enemy.new())
	#start running
	
	pass 

func _process(delta: float) -> void:
	#tick the game clock
	game_clock += delta
	
	#tick down reload, fire rate, weapon swap
	#HoT, Dot
	#tick player and enemies
	player_character.update(delta)
	#if no enemies in range, walk forward
	#else if combat
	#if current weapon has ammo and fire rate < 0 and not reloading
	#print(player_fire_rate_cooldown)
	
	pass

func inRange(pDistance:float, pRange:float, eDistance:float) -> bool:
	if( (eDistance - pDistance) < pRange):
		return true
	return false
