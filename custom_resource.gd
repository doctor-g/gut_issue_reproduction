class_name CustomResource
extends Resource

@export var a_value : String

@export var nested : NestedResource

func foo()->String:
	return "Actual implementation"
