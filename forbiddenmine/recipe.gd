extends CanvasLayer

func _on_button_pressed() -> void:
	var stone_quantity = 5
	for item in GlobalVar.inventory:
		if item != null and item["name"] == "Stone" and item["quantity"] >= stone_quantity:
			print("Crafted")
			item["quantity"] -= stone_quantity
			if item["quantity"] == 0:
				item = null
			GlobalVar.inventory_updated.emit()
			GlobalVar.sync_inventory_to_hotbar()
			return
	print("Not enough materials")
