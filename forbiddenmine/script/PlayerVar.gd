extends Node

var player_name
var player_health = 100
var player_hunger = 100
var player_thirst = 100

func restore_health(amount: int) -> void:
	player_health += amount
	player_health = min(player_health, 100)
	print("Player health: ", player_health)

func restore_hunger(amount: int) -> void:
	player_hunger += amount
	player_hunger = min(player_hunger, 100)
	print("Player stamina: ", player_hunger)
	
func restore_thrist(amount: int) -> void:
	player_thirst += amount
	player_thirst = min(player_thirst, 100)
	print("Player stamina: ", player_thirst)
