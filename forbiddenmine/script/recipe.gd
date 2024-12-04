extends CanvasLayer

#WEAPONS

@onready var button1 = $TabContainer/Weapon/acaccia/TextureRect/Buttonacacia
@onready var button2 = $TabContainer/Weapon/acaccia/TextureRect2/Button2acacia
@onready var button3 = $TabContainer/Weapon/acaccia/TextureRect3/Button3acacia
@onready var button4 = $"TabContainer/Weapon/frosted oak/TextureRect/Button4frosted"
@onready var button5 = $"TabContainer/Weapon/frosted oak/TextureRect2/Button5frosted"
@onready var button6 = $"TabContainer/Weapon/frosted oak/TextureRect3/Button6frosted"
@onready var button7 = $TabContainer/Weapon/oak/TextureRect/Button7oak
@onready var button8 = $TabContainer/Weapon/oak/TextureRect2/Button8oak
@onready var button9 = $TabContainer/Weapon/oak/TextureRect3/Button9oak
@onready var button10 = $TabContainer/Weapon/jungle/TextureRect/Button10jungle
@onready var button11 = $TabContainer/Weapon/jungle/TextureRect2/Button11jungle
@onready var button12 = $TabContainer/Weapon/jungle/TextureRect3/Button12jungle
@onready var button13 = $TabContainer/Weapon/stone/TextureRect/Button13stone
@onready var button14 = $TabContainer/Weapon/stone/TextureRect2/Button14stone
@onready var button15 = $TabContainer/Weapon/stone/TextureRect3/Button15stone
@onready var button16 = $TabContainer/Weapon/iron/TextureRect/Button16iron
@onready var button17 = $TabContainer/Weapon/iron/TextureRect2/Button17iron
@onready var button18 = $TabContainer/Weapon/iron/TextureRect3/Button18iron
@onready var button19 = $TabContainer/Weapon/gold/TextureRect/Button19gold
@onready var button20 = $TabContainer/Weapon/gold/TextureRect2/Button20gold
@onready var button21 = $TabContainer/Weapon/gold/TextureRect3/Button21gold
@onready var button22 = $TabContainer/Weapon/diamond/TextureRect/Button22diamond
@onready var button23 = $TabContainer/Weapon/diamond/TextureRect2/Button23diamond
@onready var button24 = $TabContainer/Weapon/diamond/TextureRect3/Button24diamond
@onready var button25 = $TabContainer/Weapon/emerald/TextureRect/Button25emerald
@onready var button26 = $TabContainer/Weapon/emerald/TextureRect2/Button26emerald
@onready var button27 = $TabContainer/Weapon/emerald/TextureRect3/Button27emerald
@onready var button28 = $TabContainer/Weapon/ruby/TextureRect/Button28ruby
@onready var button29 = $TabContainer/Weapon/ruby/TextureRect2/Button29ruby
@onready var button30 = $TabContainer/Weapon/ruby/TextureRect3/Button30ruby
@onready var button31 = $TabContainer/Weapon/topaz/TextureRect/Button31topaz
@onready var button32 = $TabContainer/Weapon/topaz/TextureRect2/Button32topaz
@onready var button33 = $TabContainer/Weapon/topaz/TextureRect3/Button33topaz
@onready var button34 = $TabContainer/Weapon/magma/TextureRect/Button34magma
@onready var button35 = $TabContainer/Weapon/magma/TextureRect2/Button35magma
@onready var button36 = $TabContainer/Weapon/magma/TextureRect3/Button36magma

#TOOLS

@onready var button_1 = $TabContainer/Tools/acacia/TextureRect/ButtonACACIA
@onready var button_2 = $TabContainer/Tools/acacia/TextureRect2/ButtonACACIA2
@onready var button_3 = $TabContainer/Tools/acacia/TextureRect3/ButtonACACIA3
@onready var button_4 = $TabContainer/Tools/frosted/TextureRect/ButtonFROST
@onready var button_5 = $TabContainer/Tools/frosted/TextureRect2/ButtonFROST2
@onready var button_6 = $TabContainer/Tools/frosted/TextureRect3/ButtonFROST3
@onready var button_7 = $TabContainer/Tools/Oak/TextureRect/ButtonOAK
@onready var button_8 = $TabContainer/Tools/Oak/TextureRect2/ButtonOAK2
@onready var button_9 = $TabContainer/Tools/Oak/TextureRect3/ButtonOAK3
@onready var button_10 = $TabContainer/Tools/Jungle/TextureRect/ButtonJUNGLE
@onready var button_11 = $TabContainer/Tools/Jungle/TextureRect2/ButtonJUNGLE2
@onready var button_12 = $TabContainer/Tools/Jungle/TextureRect3/ButtonJUNGLE3
@onready var button_13 = $TabContainer/Tools/Stone/TextureRect/ButtonSTONE
@onready var button_14 = $TabContainer/Tools/Stone/TextureRect2/ButtonSTONE2
@onready var button_15 = $TabContainer/Tools/Stone/TextureRect3/ButtonSTONE3
@onready var button_16 = $TabContainer/Tools/iron/TextureRect/ButtonIRON
@onready var button_17 = $TabContainer/Tools/iron/TextureRect2/ButtonIRON2
@onready var button_18 = $TabContainer/Tools/iron/TextureRect3/ButtonIRON3
@onready var button_19 = $TabContainer/Tools/gold/TextureRect/ButtonGOLD
@onready var button_20 = $TabContainer/Tools/gold/TextureRect2/ButtonGOLD2
@onready var button_21 = $TabContainer/Tools/gold/TextureRect3/ButtonGOLD3
@onready var button_22 = $TabContainer/Tools/diamond/TextureRect/ButtonDIAMOND
@onready var button_23 = $TabContainer/Tools/diamond/TextureRect2/ButtonDIAMOND2
@onready var button_24 = $TabContainer/Tools/diamond/TextureRect3/ButtonDIAMOND3
@onready var button_25 = $TabContainer/Tools/emerald/TextureRect/ButtonEMERALD 
@onready var button_26 = $TabContainer/Tools/emerald/TextureRect2/ButtonEMERALD2
@onready var button_27 = $TabContainer/Tools/emerald/TextureRect3/ButtonEMERALD3
@onready var button_28 = $TabContainer/Tools/ruby/TextureRect/ButtonRUBY
@onready var button_29 = $TabContainer/Tools/ruby/TextureRect2/ButtonRUBY2
@onready var button_30 = $TabContainer/Tools/ruby/TextureRect3/ButtonRUBY3
@onready var button_31 = $TabContainer/Tools/topaz/TextureRect/ButtonTOPAZ
@onready var button_32 = $TabContainer/Tools/topaz/TextureRect2/ButtonTOPAZ2
@onready var button_33 = $TabContainer/Tools/topaz/TextureRect3/ButtonTOPAZ3
@onready var button_34 = $TabContainer/Tools/magma/TextureRect/ButtonMAGMA
@onready var button_35 = $TabContainer/Tools/magma/TextureRect2/ButtonMAGMA2
@onready var button_36 = $TabContainer/Tools/magma/TextureRect3/ButtonMAGMA3

@onready var button_m1 = $"TabContainer/Materials/TEMP/Acacia PLANKS/CRAFT1"
@onready var button_m2 = $TabContainer/Materials/TEMP/Sticks/CRAFT2



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
"Magma BroadSword": {"name": "Magma BroadSword", "type": "weapon", "texture": preload("res://Item assets/weapon/magma_broadsword.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},

"Acacia Axe": {"name": "Acacia Axe", "type": "tool", "texture": preload("res://Item assets/tools/accacia_axe.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
"Acacia Pickaxe": {"name": "Acacia Pickaxe", "type": "tool", "texture": preload("res://Item assets/tools/accacia_pickaxe.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},
"Acacia Shovel": {"name": "Acacia Shovel", "type": "tool", "texture": preload("res://Item assets/tools/accacia_shovel.png"), "effect": "Slash", "scene_path": "res://Scene/Inventory.tscn"},


#MATERIALS

"Acacia Planks": {"name": "Acacia Planks", "type": "Material", "texture": preload("res://Item assets/wood-tree-blocks/acacia_planks.png"), "effect": "none", "scene_path": "res://Scene/Inventory.tscn"},
"Stick": {"name": "Acacia Shovel", "type": "Material", "texture": preload("res://Item assets/wood-tree-blocks/stick_base.png"), "effect": "none", "scene_path": "res://Scene/Inventory.tscn"},

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

	# Check if required materials are available
	for material_name in recipe.keys():
		if material_name != "result":
			var material = null
			var material_index = -1
			# Check if the material is a list of possible materials (e.g., wood types)
			if material_name == "Wood":  # Replace with your specific key for wood types
				var wood_types = ["Acacia Planks", "Oak Planks", "Birch Planks"]  # Add all possible wood types here
				var found = false
				for wood_type in wood_types:
					for i in range(GlobalVar.inventory.size()):
						var item = GlobalVar.inventory[i]
						if item != null and item["name"] == wood_type and item["quantity"] >= recipe[material_name]:
							material = item
							material_index = i
							found = true
							break
					if found:
						break
			else:
				# Regular material handling for other materials
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
		# Ensure there's space for the result item
		var result_item = recipe["result"]
		result_item["quantity"] = 1
		if !GlobalVar.has_space_for_item(result_item):
			print("Cannot craft, inventory is full.")
			return

		# Deduct materials from inventory
		print("Crafted " + recipe["result"]["name"])
		for material_name in materials_found.keys():
			materials_found[material_name]["quantity"] -= recipe[material_name]
			if materials_found[material_name]["quantity"] <= 0:
				remove_item(materials_found[material_name], material_indices[material_name])

		GlobalVar.inventory_updated.emit()
		GlobalVar.sync_inventory_to_hotbar()

		# Add crafted item to inventory
		GlobalVar.add_item(result_item)
		GlobalVar.inventory_updated.emit()
		GlobalVar.sync_inventory_to_hotbar()
		GlobalVar.save_inventory()

	print("Not enough materials")




func _on_button_pressedSHOW() -> void:
	button1.visible = true
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW2() -> void:
	button2.visible = true
	button1.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW3() -> void:
	button3.visible = true
	button1.visible = false
	button2.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW4() -> void:
	button4.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW5() -> void:
	button5.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW6() -> void:
	button6.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false

func _on_button_pressedSHOW7() -> void:
	button7.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW8() -> void:
	button8.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW9() -> void:
	button9.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW10() -> void:
	button10.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW11() -> void:
	button11.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW12() -> void:
	button12.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW13() -> void:
	button13.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false

func _on_button_pressedSHOW14() -> void:
	button14.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW15() -> void:
	button15.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW16() -> void:
	button16.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW17() -> void:
	button17.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW18() -> void:
	button18.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW19() -> void:
	button19.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW20() -> void:
	button20.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW21() -> void:
	button21.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW22() -> void:
	button22.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW23() -> void:
	button23.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false

func _on_button_pressedSHOW24() -> void:
	button24.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW25() -> void:
	button25.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW26() -> void:
	button26.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW27() -> void:
	button27.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW28() -> void:
	button28.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW29() -> void:
	button29.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW30() -> void:
	button30.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW31() -> void:
	button31.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW32() -> void:
	button32.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false

func _on_button_pressedSHOW33() -> void:
	button33.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button34.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW34() -> void:
	button34.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button35.visible = false
	button36.visible = false


func _on_button_pressedSHOW35() -> void:
	button35.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button36.visible = false


func _on_button_pressedSHOW36() -> void:
	button36.visible = true
	button1.visible = false
	button2.visible = false
	button3.visible = false
	button4.visible = false
	button5.visible = false
	button6.visible = false
	button7.visible = false
	button8.visible = false
	button9.visible = false
	button10.visible = false
	button11.visible = false
	button12.visible = false
	button13.visible = false
	button14.visible = false
	button15.visible = false
	button16.visible = false
	button17.visible = false
	button18.visible = false
	button19.visible = false
	button20.visible = false
	button21.visible = false
	button22.visible = false
	button23.visible = false
	button24.visible = false
	button25.visible = false
	button26.visible = false
	button27.visible = false
	button28.visible = false
	button29.visible = false
	button30.visible = false
	button31.visible = false
	button32.visible = false
	button33.visible = false
	button34.visible = false
	button35.visible = false

func _on_button_pressed() -> void:
	var recipe = {
		"Stick": 1,
		"Acacia Planks": 1,
		"result": tile_to_item_data["Acacia Dagger"].duplicate()
	}
	craft_item(recipe)
		


func _on_button_2_pressed() -> void:
		var recipe = {
			"Stick": 1,
			"Acacia Planks": 2,
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
	#-----------------------------------------------------------------------

func _on_button_acacia_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Acacia Planks" : 3,
		"result": tile_to_item_data["Acacia Axe"]
	}
	craft_item(recipe)

func _on_button_acacia_2_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Acacia Planks" : 5,
		"result": tile_to_item_data["Acacia Pickaxe"]
	}
	craft_item(recipe)


func _on_button_acacia_3_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Acacia Planks" : 1,
		"result": tile_to_item_data["Acacia Shovel"]
	}
	craft_item(recipe)


func _on_button_frost_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Frosted Oak Planks" : 3,
		"result": tile_to_item_data["Frosted Oak Axe"]
	}
	craft_item(recipe)


func _on_button_frost_2_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Frosted Oak Planks" : 5,
		"result": tile_to_item_data["Frosted Oak Pickaxe"]
	}
	craft_item(recipe)

func _on_button_frost_3_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Frosted Oak Planks" : 1,
		"result": tile_to_item_data["Frosted Oak Shovel"]
	}
	craft_item(recipe)


func _on_button_oak_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Oak Planks" : 3,
		"result": tile_to_item_data["Oak Axe"]
	}
	craft_item(recipe)


func _on_button_oak_2_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Oak Planks" : 5,
		"result": tile_to_item_data["Oak Pickaxe"]
	}
	craft_item(recipe)


func _on_button_oak_3_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Oak Planks" : 1,
		"result": tile_to_item_data["Oak Shovel"]
	}
	craft_item(recipe)

func _on_button_jungle_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Jungle Wood" : 3,
		"result": tile_to_item_data["Jungle Axe"]
	}
	craft_item(recipe)

func _on_button_jungle_2_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Jungle Wood" : 5,
		"result": tile_to_item_data["Jungle Pickaxe"]
	}
	craft_item(recipe)

func _on_button_jungle_3_pressed() -> void:
	var recipe = {
		"Stick" : 2,
		"Jungle Wood" : 1,
		"result": tile_to_item_data["Jungle Shovel"]
	}
	craft_item(recipe)


func _on_button_iron_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Iron Ore": 3,
	"result": tile_to_item_data["Iron Axe"]
	}
	craft_item(recipe)

func _on_button_iron_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Iron Ore": 5,
	"result": tile_to_item_data["Iron Pickaxe"]
	}
	craft_item(recipe)

func _on_button_iron_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Iron Ore": 1,
	"result": tile_to_item_data["Iron Shovel"]
	}
	craft_item(recipe)

func _on_button_gold_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Gold Ore": 3,
	"result": tile_to_item_data["Gold Axe"]
	}
	craft_item(recipe)

func _on_button_gold_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Gold Ore": 5,
	"result": tile_to_item_data["Gold Pickaxe"]
	}
	craft_item(recipe)

func _on_button_gold_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Gold Ore": 1,
	"result": tile_to_item_data["Gold Shovel"]
	}
	craft_item(recipe)

func _on_button_diamond_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Diamond Ore": 3,
	"result": tile_to_item_data["Diamond Axe"]
	}
	craft_item(recipe)

func _on_button_diamond_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Diamond Ore": 5,
	"result": tile_to_item_data["Diamond Pickaxe"]
	}
	craft_item(recipe)

func _on_button_diamond_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Diamond Ore": 1,
	"result": tile_to_item_data["Diamond Shovel"]
	}
	craft_item(recipe)

func _on_button_emerald_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Emerald Ore": 3,
	"result": tile_to_item_data["Emerald Axe"]
	}
	craft_item(recipe)

func _on_button_emerald_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Emerald Ore": 5,
	"result": tile_to_item_data["Emerald Pickaxe"]
	}
	craft_item(recipe)

func _on_button_emerald_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Emerald Ore": 1,
	"result": tile_to_item_data["Emerald Shovel"]
	}
	craft_item(recipe)

func _on_button_ruby_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Ruby Ore": 3,
	"result": tile_to_item_data["Ruby Axe"]
	}
	craft_item(recipe)

func _on_button_ruby_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Ruby Ore": 5,
	"result": tile_to_item_data["Ruby Pickaxe"]
	}
	craft_item(recipe)

func _on_button_ruby_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Ruby Ore": 1,
	"result": tile_to_item_data["Ruby Shovel"]
	}
	craft_item(recipe)

func _on_button_topaz_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Topaz Ore": 3,
	"result": tile_to_item_data["Topaz Axe"]
	}
	craft_item(recipe)

func _on_button_topaz_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Topaz Ore": 5,
	"result": tile_to_item_data["Topaz Pickaxe"]
	}
	craft_item(recipe)

func _on_button_topaz_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Topaz Ore": 1,
	"result": tile_to_item_data["Topaz Shovel"]
	}
	craft_item(recipe)

func _on_button_magma_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Magma Ore": 3,
	"result": tile_to_item_data["Magma Axe"]
	}
	craft_item(recipe)

func _on_button_magma_2_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Magma Ore": 5,
	"result": tile_to_item_data["Magma Pickaxe"]
	}
	craft_item(recipe)

func _on_button_magma_3_pressed() -> void:
	var recipe = {
	"Stick": 2,
	"Magma Ore": 1,
	"result": tile_to_item_data["Magma Shovel"]
	}
	craft_item(recipe)

func _on_button_1_SHOW() -> void:
	button_1.visible = true
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_2_SHOW() -> void:
	button_2.visible = true
	button_1.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_3_SHOW() -> void:
	button_3.visible = true
	button_1.visible = false
	button_2.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_4_SHOW() -> void:
	button_4.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false



func _on_button_5_SHOW() -> void:
	button_5.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_6_SHOW() -> void:
	button_6.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false

func _on_button_7_SHOW() -> void:
	button_7.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_8_SHOW() -> void:
	button_8.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_9_SHOW() -> void:
	button_9.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_10_SHOW() -> void:
	button_10.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_11_SHOW() -> void:
	button_11.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_12_SHOW() -> void:
	button_12.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_13_SHOW() -> void:
	button_13.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_14_SHOW() -> void:
	button_14.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false

func _on_button_15_SHOW() -> void:
	button_15.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_16_SHOW() -> void:
	button_16.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_17_SHOW() -> void:
	button_17.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_18_SHOW() -> void:
	button_18.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_19_SHOW() -> void:
	button_19.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_20_SHOW() -> void:
	button_20.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_21_SHOW() -> void:
	button_21.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_22_SHOW() -> void:
	button_22.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false

func _on_button_23_SHOW() -> void:
	button_23.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_24_SHOW() -> void:
	button_24.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_25_SHOW() -> void:
	button_25.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_26_SHOW() -> void:
	button_26.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_27_SHOW() -> void:
	button_27.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_28_SHOW() -> void:
	button_28.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_29_SHOW() -> void:
	button_29.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_30_SHOW() -> void:
	button_30.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_31_SHOW() -> void:
	button_31.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_32_SHOW() -> void:
	button_32.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_33_SHOW() -> void:
	button_33.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_34.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_34_SHOW() -> void:
	button_34.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_35.visible = false
	button_36.visible = false


func _on_button_35_SHOW() -> void:
	button_35.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_36.visible = false


func _on_button_36_SHOW() -> void:
	button_36.visible = true
	button_1.visible = false
	button_2.visible = false
	button_3.visible = false
	button_4.visible = false
	button_5.visible = false
	button_6.visible = false
	button_7.visible = false
	button_8.visible = false
	button_9.visible = false
	button_10.visible = false
	button_11.visible = false
	button_12.visible = false
	button_13.visible = false
	button_14.visible = false
	button_15.visible = false
	button_16.visible = false
	button_17.visible = false
	button_18.visible = false
	button_19.visible = false
	button_20.visible = false
	button_21.visible = false
	button_22.visible = false
	button_23.visible = false
	button_24.visible = false
	button_25.visible = false
	button_26.visible = false
	button_27.visible = false
	button_28.visible = false
	button_29.visible = false
	button_30.visible = false
	button_31.visible = false
	button_32.visible = false
	button_33.visible = false
	button_34.visible = false
	button_35.visible = false


	#---------------------------------------------


func _on_button_TEST1() -> void:
	var recipe = {
	"Acacia Log": 1,
	"result": tile_to_item_data["Acacia Planks"]
	}
	craft_item(recipe)


func _on_button_TEST2() -> void:
	var recipe = {
	"Wood": 2,  # Here, "Wood" will match any of the wood types you defined in the list
	"result": tile_to_item_data["Stick"]
	}
	craft_item(recipe)

func _on_button_TESTshow1() -> void:
	button_m1.visible = true
	button_m2.visible = false


func _on_button_TESTshow2() -> void:
	button_m2.visible = true
	button_m1.visible = false
