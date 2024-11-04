extends GridContainer

#region Testing
@export var ITEM : crafttest
@export var ITEM2 : crafttest
func _ready():
	await get_tree().create_timer(2).timeout
	add_item(ITEM)
	await get_tree().create_timer(2).timeout
	add_item(ITEM2)
#endregion


func add_item(item):
	for i in get_children():
		if i.item == null:
			i.item = item
			return
			
func remove_item(item):
	for i in get_children():
		if i.item == item:
			i.item = null
			return
			
