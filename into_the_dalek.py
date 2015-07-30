from sys import exit
from random import randint

import rooms


#################### SCENE INIT
class Scene(object):

	def enter(self):
		"""The basic setup of a room/scene"""
		print("This scene is not yet configured.")
		exit(1)


#################### ENGINE INIT
class Engine(object):

	def __init__(self, scene_map):
		"""Initiates the game map"""
		self.scene_map = scene_map

	def play(self):
		"""Moves program through game map"""
		current_scene = self.scene_map.opening_scene()

		while True:
			# While the game is playing, moves us to next scene in map
			print("\n-----------")
			next_scene_name = current_scene.enter()
			current_scene = self.scene_map.next_scene(next_scene_name)


#################### MAP INIT
class Map(object):

	# list of the game scenes in order, defines the game map
	scenes = {
		'aristotle': rooms.Aristotle(),
		'cortex_vault': rooms.CortexVault(),
		'waste_center': rooms.WasteCenter(),
		'power_center': rooms.PowerCenter(),
		'consciousness_link': rooms.ConsciousnessLink(),
		'victory': rooms.Victory(),
		'death': rooms.Death()
	}

	def __init__(self, start_scene):
		"""Initiates the opening scene"""
		self.start_scene = start_scene

	def next_scene(self, scene_name):
		"""Moves game into the next scene in game map"""
		return Map.scenes.get(scene_name)

	def opening_scene(self):
		"""Moves opening to next scene"""
		return self.next_scene(self.start_scene)


#################### VARIABLES
# sets the opening scene of the game
a_map = Map('aristotle')
# sets the engine to run our game map
a_game = Engine(a_map)
# begins a game play
a_game.play()

