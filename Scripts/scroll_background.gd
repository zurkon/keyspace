extends ParallaxBackground


export (float) var scrolling_speed = 40.0

func _physics_process(delta):
	scroll_offset.y += scrolling_speed * delta
