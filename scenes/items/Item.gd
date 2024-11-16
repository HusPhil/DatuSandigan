extends Resource
class_name Item

enum wp_types { arnis, sword, spear, bow, spell_book }

@export var name : String
@export var type : wp_types
@export var texture : Texture2D
@export var damage : float 
@export var icon : Texture2D
@export var animation : String
@export var projectile : int
