class_name Entity extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# uninitialized properties
var animation_tree: AnimationTree
var playback : AnimationNodeStateMachinePlayback
var debug_label : Label
var sprite : Sprite2D
var base_gravity : float
var jump_impulse : float
