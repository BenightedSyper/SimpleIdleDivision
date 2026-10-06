extends Node2D
class_name GameManager

var game_clock: float = 0.0

var zone: int = 1
var distance: float = 0.0

var player_character: Player

var enemy_array: Array[Enemy]

enum PLAYER_STATES { WALKING, COMBAT, IDLE, RELOADING }
var current_state: PLAYER_STATES = PLAYER_STATES.IDLE

var timer_reload: float = 0.0
var timer_fire_rate: float = 0.0
var current_clip: float = 0.0

func _ready() -> void:
	#load character
	player_character = Player.new()
	reload_clip()
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
	#player_character.update(delta)
	#if no enemies in range, walk forward
	#else if combat
	#if current weapon has ammo and fire rate < 0 and not reloading
	#print(player_fire_rate_cooldown)
	
		#tick down fire rate
	match current_state:
		PLAYER_STATES.RELOADING:
			print("curr reload time = ", timer_reload)
			if timer_reload <= 0:
				timer_fire_rate = 0.0
				current_clip = player_character.clip_size
				current_state = PLAYER_STATES.COMBAT
			timer_reload -= delta
			pass
		PLAYER_STATES.WALKING:
			pass
		PLAYER_STATES.COMBAT:
			#check if enemy in range
			#attack the enemy
			#set auto attack time
			pass
	
	pass
class Attack:
	var damage: float = 0.0
	var accuracy: float = 0.0
	func _init( _val: float, _acc: float) -> void:
		damage = _val
		accuracy = _acc

func attack_with_primary() -> Array[Attack]:
	var atk: Array[Attack]
	var acc = randf_range(0, player_character.accuracy)
	for i in player_character.burst_size:
		atk.append(Attack.new(player_character.base_damage, acc * (pow((1-player_character.recoil),i))))
		print(atk[i].accuracy)
	return atk

func reload_clip() -> void:
	timer_reload = player_character.reload_time
	current_state = PLAYER_STATES.RELOADING
	pass
	
func inRange(pDistance:float, pRange:float, eDistance:float) -> bool:
	if( (eDistance - pDistance) < pRange):
		return true
	return false
