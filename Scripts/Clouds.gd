extends Node2D

const CLOUD_SCENE = preload('res://Scenes/Cloud.tscn')

func _process(_delta):
	if(get_child_count() < 6):
		var _cloud = CLOUD_SCENE.instantiate()
		self.add_child(_cloud)
		pass
