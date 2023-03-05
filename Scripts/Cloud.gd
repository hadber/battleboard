extends Node2D

# how fast it moves left or right
var SPEED:float = 0
# how far it moves up and down 
var SIN_AMPL:float = 0
# how fast it moves up and down
var SIN_FREQ:float = 0 
# how far down it should start from y=0
var SIN_OFFSET:float = 0 
 # current position
var SIN_CURR:float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# randomize everything to 
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	SPEED = rng.randf_range(0.2, 1)
	SIN_AMPL = rng.randf_range(1, 100)
	SIN_FREQ = rng.randf_range(0.001, 0.01)
	SIN_OFFSET = rng.randf_range(0, 800)
	self.position.x = -100
	var iscale:float = rng.randf_range(0.1, 1)
	self.scale = Vector2(iscale, iscale)
	
	randomize_sprite(rng.randi_range(1, 3))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.position.x += SPEED
	self.position.y = SIN_AMPL * sin (SIN_CURR) + SIN_OFFSET
	SIN_CURR += SIN_FREQ
	
	if(position.x > 3000):
		self.queue_free()

func randomize_sprite(cloudno:int):
	$Sprite2D.texture = load("res://Assets/clouds/cloud" + str(cloudno) + ".png")
