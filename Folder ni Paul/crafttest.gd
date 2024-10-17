extends Resource
class_name crafttest

@export var icon: Texture2D
@export var name: String

@export var recipe: Array[crafttest]

@export_enum("Beast","Material")
var type = "Material"

@export_multiline var description: String
