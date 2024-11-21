extends CanvasLayer

var tile_to_item_data = {
	"Dagger": {"name": "Dagger", "type": "weapon", "texture": preload("res://Item assets/weapon/acacia_dagger.png"), "effect": "Slash"},
	"Broad Sword": {"name": "Broad Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/accacia_broadsword.png"), "effect": "Slash"},
	"Gem Sword": {"name": "Gem Sword", "type": "weapon", "texture": preload("res://Item assets/weapon/emerald_broadsword.png"), "effect": "Slash"} # New item for the recipe
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
		return
	
	print("Not enough materials")


func _on_button_pressed() -> void:
	var recipe = {
		"Stone": 5,
		"Ruby": 1,
		"result": tile_to_item_data["Dagger"]
	}
	craft_item(recipe)


func _on_button_2_pressed() -> void:
	var recipe = {
		"Stone": 5,
		"Gold": 2,
		"result": tile_to_item_data["Broad Sword"]
	}
	craft_item(recipe)
