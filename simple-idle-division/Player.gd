extends Node
class_name Player

var strength: int = 1
var dexterity: int = 1
var intellegence: int = 1

var level: int = 1
var experience: int = 0

var life: float = 1.0
var life_regen: float = 0.01

var accuracy: float = 100.0
var movement_speed: float = 1.0

var timer_reload: float = 0.0
var timer_fire_rate: float = 0.0

enum PLAYER_STATES { WALKING, COMBAT, IDLE, RELOADING }
var current_state: PLAYER_STATES = PLAYER_STATES.IDLE

#weapon
var base_damage: float = 35.0
var rate_of_fire: float = 4.62
var clip_size: float = 30.0
var reload_time: float = 4.0
var optimal_range: float = 8.0
var critical_chance: float = 0.05
var critical_damage: float = 1.5
var recoil: float = 0.05

var knockback: float = 0.0
var projectiles_per_shot: float = 1.0
var burst_size: float = 3.0
var piercing: float = 0.0

var current_clip: float = 0.0

func _init() -> void:
	timer_reload = reload_time
	current_state = PLAYER_STATES.RELOADING
	#print("curr reload time = ", timer_reload)
	pass 

func update(delta: float) -> void:
	#tick down fire rate
	match current_state:
		PLAYER_STATES.RELOADING:
			if timer_reload <= 0:
				timer_fire_rate = 0.0
				current_clip = clip_size
				current_state = PLAYER_STATES.COMBAT
			timer_reload -= delta
			pass
		PLAYER_STATES.WALKING:
			pass
		PLAYER_STATES.COMBAT:
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
	var acc = randf_range(0, accuracy)
	for round in burst_size:
		atk.append(Attack.new(base_damage, acc * (pow((1-recoil),round))))
		print(atk[round].accuracy)
	return atk

func get_save_data() -> Object:
	var save_data = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"player_level" : level,
		"player_experience" : experience
	}
	return save_data
