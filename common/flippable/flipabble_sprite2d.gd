extends Sprite2D
class_name FlippableSprite

signal is_flipped(flip_val)

var flipped : bool = false:
	set(new_flip_val):
		if new_flip_val != flipped:
			flipped = new_flip_val
			self.flip_h = flipped
			is_flipped.emit(flipped)
			
			
