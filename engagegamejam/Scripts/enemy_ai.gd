extends CharacterBody2D
@onready var target = $"../CharacterBody2D"
var speed = 150

func _physics_process(delta: float) -> void:
	# Move towards the target
	var direction = (target.position - position).normalized()
	velocity = direction * speed
	# Move the character
	look_at(target.position)
	move_and_slide()

# # Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	pass # Replace with function body.


# # Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass
