extends CanvasLayer

var tile_to_item_data = {
	"Acacia Dagger": {"name": "Acacia Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/acacia_dagger.png"), "effect": "restore_health", "value" : 50, "scene_path": "res://Scene/Inventory.tscn"},
	"Acacia Sword": {"name": "Acacia Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/accacia_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Acacia BroadSword": {"name": "Acacia BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/accacia_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	
	"Frosted Oak Dagger": {"name": "Frosted Oak Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/frosted_oak_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Frosted Oak Sword": {"name": "Frosted Oak Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/frosted_oak_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Frosted Oak BroadSword": {"name": "Frosted Oak BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/frosted_oak_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Oak Dagger": {"name": "Oak Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/oak_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Oak Sword": {"name": "Oak Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/oak_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Oak BroadSword": {"name": "Oak BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/oak_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Jungle Dagger": {"name": "Jungle Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/jungle_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Jungle Sword": {"name": "Jungle Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/jungle_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Jungle BroadSword": {"name": "Jungle BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/jungle_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Stone Dagger": {"name": "Stone Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/stone_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Stone Sword": {"name": "Stone Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/stone_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Stone BroadSword": {"name": "Stone BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/stone_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Iron Dagger": {"name": "Iron Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/iron_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Iron Sword": {"name": "Iron Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/iron_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Iron BroadSword": {"name": "Iron BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/iron_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Gold Dagger": {"name": "Gold Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/gold_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Gold Sword": {"name": "Gold Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/gold_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Gold BroadSword": {"name": "Gold BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/gold_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Diamond Dagger": {"name": "Diamond Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/diamond_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Diamond Sword": {"name": "Diamond Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/diamond_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Diamond BroadSword": {"name": "Diamond BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/diamond_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Emerald Dagger": {"name": "Emerald Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/emerald_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Emerald Sword": {"name": "Emerald Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/emerald_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Emerald BroadSword": {"name": "Emerald BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/emerald_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Ruby Dagger": {"name": "Ruby Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/ruby_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Ruby Sword": {"name": "Ruby Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/ruby_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Ruby BroadSword": {"name": "Ruby BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/ruby_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Topaz Dagger": {"name": "Topaz Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/topaz_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Topaz Sword": {"name": "Topaz Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/topaz_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Topaz BroadSword": {"name": "Topaz BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/topaz_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

	"Magma Dagger": {"name": "Magma Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/magma_dagger.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Magma Sword": {"name": "Magma Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/magma_sword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
	"Magma BroadSword": {"name": "Magma BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/magma_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"}

}


func remove_item(item, item_index):
	GlobalVar.inventory[item_index] = null
	for i in range(GlobalVar.hotbar_inventory.size()):
		if GlobalVar.hotbar_inventory[i] == item:
			GlobalVar.hotbar_inventory[i] = null
			break

func craft_item(recipe: Dictionary) -> void:
	var materials_found = {}
	var material_indices = {}
	var can_craft = true
	
	for material_name in recipe.keys():
		if material_name != "result":
			var material = null
			var material_index = -1
			for i in range(GlobalVar.inventory.size()):
				var item = GlobalVar.inventory[i]
				if item != null and item["name"] == material_name and item["quantity"] >= recipe[material_name]:
					material = item
					material_index = i
					break
			if material == null:
				can_craft = false
				break
			materials_found[material_name] = material
			material_indices[material_name] = material_index
	
	if can_craft:
		print("Crafted " + recipe["result"]["name"])

		for material_name in materials_found.keys():
			materials_found[material_name]["quantity"] -= recipe[material_name]
			
			if materials_found[material_name]["quantity"] <= 0:
				remove_item(materials_found[material_name], material_indices[material_name])

		GlobalVar.inventory_updated.emit()
		GlobalVar.sync_inventory_to_hotbar()

		var result_item = recipe["result"]
		result_item["quantity"] = 1
		
		GlobalVar.add_item(result_item)
		GlobalVar.inventory_updated.emit()
		GlobalVar.sync_inventory_to_hotbar()
		return
	
	print("Not enough materials")


func _on_button_pressed() -> void:
	var recipe = {
		#"Stick": 1,
		#"Acacia Planks": 1,
		"result": tile_to_item_data["Acacia Dagger"].duplicate()
	}
	craft_item(recipe)
	
func _on_button_2_pressed() -> void:
		var recipe = {
			#"Stick": 1,
			#"Acacia Planks": 2,
			"result": tile_to_item_data["Acacia Sword"]
		}
		craft_item(recipe)

func _on_button_3_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Acacia Planks": 4,
		"result": tile_to_item_data["Acacia BroadSword"]
	}
	craft_item(recipe)

func _on_button_4_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Frosted Oak Planks": 1,
		"result": tile_to_item_data["Frosted Oak Dagger"]
	}
	craft_item(recipe)

func _on_button_5_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Frosted Oak Planks": 2,
		"result": tile_to_item_data["Frosted Oak Sword"]
	}
	craft_item(recipe)

func _on_button_6_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Frosted Oak Planks": 4,
		"result": tile_to_item_data["Frosted Oak BroadSword"]
	}
	craft_item(recipe)

func _on_button_7_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Oak Planks": 1,
		"result": tile_to_item_data["Oak Dagger"]
	}
	craft_item(recipe)

func _on_button_8_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Oak Planks": 2,
		"result": tile_to_item_data["Oak Sword"]
	}
	craft_item(recipe)

func _on_button_9_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Oak Planks": 4,
		"result": tile_to_item_data["Oak BroadSword"]
	}
	craft_item(recipe)

func _on_button_10_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Jungle Wood": 1,
		"result": tile_to_item_data["Jungle Dagger"]
	}
	craft_item(recipe)

func _on_button_11_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Jungle Wood": 2,
		"result": tile_to_item_data["Jungle Sword"]
	}
	craft_item(recipe)

func _on_button_12_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Jungle Wood": 4,
		"result": tile_to_item_data["Jungle BroadSword"]
	}
	craft_item(recipe)

func _on_button_13_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Stone": 1,
		"result": tile_to_item_data["Stone Dagger"]
	}
	craft_item(recipe)

func _on_button_14_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Stone": 2,
		"result": tile_to_item_data["Stone Sword"]
	}
	craft_item(recipe)

func _on_button_15_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Stone": 4,
		"result": tile_to_item_data["Stone BroadSword"]
	}
	craft_item(recipe)

func _on_button_16_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Iron Ore": 1,
		"result": tile_to_item_data["Iron Dagger"]
	}
	craft_item(recipe)

func _on_button_17_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Iron Ore": 2,
		"result": tile_to_item_data["Iron Sword"]
	}
	craft_item(recipe)

func _on_button_18_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Iron Ore": 4,
		"result": tile_to_item_data["Iron BroadSword"]
	}
	craft_item(recipe)

func _on_button_19_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Gold Ore": 1,
		"result": tile_to_item_data["Gold Dagger"]
	}
	craft_item(recipe)

func _on_button_20_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Gold Ore": 2,
		"result": tile_to_item_data["Gold Sword"]
	}
	craft_item(recipe)

func _on_button_21_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Gold Ore": 4,
		"result": tile_to_item_data["Gold BroadSword"]
	}
	craft_item(recipe)

func _on_button_22_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Diamond Ore": 1,
		"result": tile_to_item_data["Diamond Dagger"]
	}
	craft_item(recipe)

func _on_button_23_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Diamond Ore": 2,
		"result": tile_to_item_data["Diamond Sword"]
	}
	craft_item(recipe)

func _on_button_24_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Diamond Ore": 4,
		"result": tile_to_item_data["Diamond BroadSword"]
	}
	craft_item(recipe)

func _on_button_25_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Emerald Ore": 1,
		"result": tile_to_item_data["Emerald Dagger"]
	}
	craft_item(recipe)

func _on_button_26_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Emerald Ore": 2,
		"result": tile_to_item_data["Emerald Sword"]
	}
	craft_item(recipe)

func _on_button_27_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Emerald Ore": 4,
		"result": tile_to_item_data["Emerald BroadSword"]
	}
	craft_item(recipe)

func _on_button_28_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Ruby Ore": 1,
		"result": tile_to_item_data["Ruby Dagger"]
	}
	craft_item(recipe)

func _on_button_29_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Ruby Ore": 2,
		"result": tile_to_item_data["Ruby Sword"]
	}
	craft_item(recipe)

func _on_button_30_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Ruby Ore": 4,
		"result": tile_to_item_data["Ruby BroadSword"]
	}
	craft_item(recipe)

func _on_button_31_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Topaz Ore": 1,
		"result": tile_to_item_data["Topaz Dagger"]
	}
	craft_item(recipe)

func _on_button_32_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Topaz Ore": 2,
		"result": tile_to_item_data["Topaz Sword"]
	}
	craft_item(recipe)

func _on_button_33_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Topaz Ore": 4,
		"result": tile_to_item_data["Topaz BroadSword"]
	}
	craft_item(recipe)

func _on_button_34_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Magma Ore": 1,
		"result": tile_to_item_data["Magma Dagger"]
	}
	craft_item(recipe)

func _on_button_35_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Magma Ore": 2,
		"result": tile_to_item_data["Magma Sword"]
	}
	craft_item(recipe)

func _on_button_36_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Magma Ore": 4,
		"result": tile_to_item_data["Magma BroadSword"]
	}
	craft_item(recipe)
