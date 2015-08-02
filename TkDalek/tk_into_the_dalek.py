from sys import exit
from tkinter import *
from random import randint
from quitter import Quitter

import tk_rooms


#################### GRAPHICS INIT
class GameDisplay(Frame):
	"""Creates a main window in which to play the game"""
	def __init__(self, parent=None):
		Frame.__init__(self, parent)

		# create a top box to tell the story
		story = """Are you ready to travel... 
							INTO THE DALEK?"""
		story_box = Text(self, bd=2, height=20, width=70, wrap=WORD)
		story_box.insert(1.0, story)
		story_box.pack(side=TOP, expand=YES, fill=BOTH)

		# create an action box to hold the games
		action_box = Frame(self, height=10, width=50)
		action_box.pack(side=TOP, expand=YES, fill=BOTH)
		
		# create play again and quit buttons
		quit_space = Frame(self)
		again_but = Button(quit_space, text='Play!', command=(lambda: a_game.play(story_box, action_box))).pack(side=LEFT)
		quit_but = Quitter(quit_space).pack(side=RIGHT)
		quit_space.pack(side=TOP, fill=X)


#################### SCENE INIT
class Scene(object):

	def enter(self, story_tag, action_tag):
		"""The basic setup of a room/scene"""
		print("This scene is not yet configured.")
		exit(1)


#################### ENGINE INIT
class Engine(object):

	def __init__(self, scene_map):
		"""Initiates the game map"""
		self.scene_map = scene_map

	def play(self, story_tag, action_tag):
		"""Moves program through game map"""
		current_scene = self.scene_map.opening_scene()

		while True:
			# While the game is playing, moves us to next scene in map
			print("\n-----------")
			next_scene_name = current_scene.enter(story_tag, action_tag)
			current_scene = self.scene_map.next_scene(next_scene_name)


#################### MAP INIT
class Map(object):

	# list of the game scenes in order, defines the game map
	scenes = {
		'aristotle': tk_rooms.Aristotle(),
		'cortex_vault': tk_rooms.CortexVault(),
		'waste_center': tk_rooms.WasteCenter(),
		'power_center': tk_rooms.PowerCenter(),
		'consciousness_link': tk_rooms.ConsciousnessLink(),
		'victory': tk_rooms.Victory(),
		'death': tk_rooms.Death()
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
# begins game play when you press game button

#################### CREATES TITLE SCREEN
root = Tk()
gd = GameDisplay(root)
gd.pack(side=TOP)
root.mainloop()
