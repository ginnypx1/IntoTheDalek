from random import randint
from sys import exit
from tkinter import *

import tk_link
import tk_logic_game
import tk_rps
import tk_vault
import tk_zap


#################### TYPES OF SCENES
class Death(object):

	quips = [
		"You are the Doctor! You are the enemy of the Daleks! You are dead!",
		"Exterminate!",
		"Only one race can survive!",
		"Attack and Destroy!",
		"You will be exterminated!",
		"Your forces will be exterminated! Annihilate! EXTERMINATE!",
		"All enemies of the Daleks must be destroyed! Exterminate!",
		"Seek! Locate! Exterminate!",
		"Nothing must interfere with the true destiny of the Daleks!! \nYou must be exterminated! Exterminated! EXTERMINATED!!",
		"YOU ARE AN ENEMY OF THE DALEKS! YOU MUST BE DESTROYED!!"
	]

	def enter(self, story_tag, action_tag):
		# chooses a death quip at random from the above list of quips
		story_tag.delete(1.0, END)
		death_quip = Death.quips[randint(0, len(self.quips)-1)]
		story_tag.insert(1.0, death_quip)
		# tells us the game is over
		game_over = "Extermination Successful. GAME OVER. The human race is dead."
		story_tag.insert(5.0, game_over)
		# exits game
		exit(1)


class Aristotle(object):

	def enter(self, story_tag, action_tag):
		# Description of room scene in story_box
		story_tag.delete(1.0, END)
		Aristotle_story = """The Tardis flickers to life in the control room of the 'Aristotle'.
You open the door and shake yourself off, get your bearings.
You and the Doctor have just rescued the rebel fighter Journey Blue.
Her shuttle was under attack from the Daleks.
Your Tardis stumbled into the battle and you joined the fight.
Now you have returned her safely to her rebel base ship.

You expect to enter to cheers, but instead, there is only silence....
You are surrounded. The rebel officers have been waiting for you.
They explain: They have captured a strange Dalek and they need your help.
This strange new Dalek appears to be... GOOD."""
		story_tag.insert(1.0, Aristotle_story)

		# Choice to act in action_box
		choice = Label(action_tag, text='Will you help confirm the existence of a GOOD Dalek?')
		choice.pack(side=TOP, fill=X)
		entries = Frame(action_tag)
		a_var = StringVar()
		a_ent = Entry(entries, textvariable=a_var).pack(side=LEFT)
		a_but = Button(entries, text='Enter', command=(lambda: chooseToHelp(a_var.get(), story_box))).pack(side=RIGHT)
		entries.pack(side=TOP, fill=X)

		def chooseToHelp(self, action, story_tag):
			if action == "no":
				no_text = "You are shoved back in your Tardis and released into space."
				story_tag.delete(1.0, END)
				story_tag.insert(1.0, no_text)
				exit(1)
			elif action == "yes":
				return tk_logic_game.logic_quiz()
			else:
				story_tag.delete(1.0, END)
				again_text = "Yes or no. There is no other choice."
				story_tag.insert(1.0, again_text)
				return 'aristotle'


class CortexVault(object):

	def enter(self, story_tag, action_tag):
		# Description of room scene
		story_tag.delete(1.0, END)
		CortexVault_story = """You find yourself inside a metal hallway, black with red lights.
There are wires everywhere. You are inside a complicated machine.
The Doctor explains that this room forms the Dalek's cortex vault.
Dalek technology designed this vault to suppress any compassion...
...And also to store all of the Dalek's memories."""
		story_tag.insert(1.0, CortexVault_story)
		# You try to break into the vault to directly link with the Dalek's processing
		return tk_vault.crack_code()


class WasteCenter(object):

	def enter(self, story_tag, action_tag):
		# Description of room scene
		story_tag.delete(1.0, END)
		WasteCenter_story = """The waste center looks like the inside of a giant garbage dumpster.
While you clean off your shoes, the Doctor whips out his sonic screwdriver
He takes some atmospheric readings.
He confirms -- this area is unguarded.
But something very nearby is emitting a very high degree of radiation.
You cannot stay inside this area for long...
		
You must leave. You must find the source of radiation.
But how can you camoflage yourself?
The Doctor suggests you rub just enough garbage on yourself...
...to cover the smell. Yuck.
You don't want to.
		
The Doctor suggets you solve the impass with a game of RPS.
Rock Paper Scissors? He can't be serious.
He is."""
		story_tag.insert(1.0, WasteCenter_story)
		# You must come up with a plan to camoflage yourself from the antibodies long enough to find the source of the radiation
		return tk_rps.rps()
		

class PowerCenter(object):

	def enter(self, story_tag, action_tag):
		# Description of room scene
		story_tag.delete(1.0, END)
		PowerCenter_story = """You find yourself inside what looks to be the guts of a central computer.
Wires, links and gauges are everywhere.
The Doctor swings his sonic screwdriver around...
'There!' He shouts, pointing to a large ray of light.
The radiation leak!'

You must plug the leak so you can continue your quest.
The Doctor hands you his sonic screwdriver.
'You shoot while I twist the right wires!' he orders."""
		story_tag.insert(1.0, PowerCenter_story)
		# You must use the sonic screwdriver to stop the radiation leak
		return tk_zap.seal_crack()


class ConsciousnessLink(object):

	def enter(self, story_tag, action_tag):
		# Description of room scene
		story_tag.delete(1.0, END)
		ConsciousnessLink_story = """You find yourself inside a giant dome.
Images, moving pictures, are all around you.
Most are horrific images of war, carnage, violence.
The Doctor explains that these are the Dalek's memories.
He urges you to look away. They will only destroy your soul.

But you see one memory that is shockingly beautiful...
You move in closer....

The Doctor explains that you're watching the creation of a star.
This could be it. This could be the memory you're looking for...
'I need to form a link to the Dalek brain...', the Doctor explains.
'I need him to think he is seeing this again for the first time.'

The Doctor has an idea.
'Quick. Tell us a joke. If we both laugh...'
'...I may be able to sync up with his brain.'"""
		story_tag.insert(1.0, ConsciousnessLink_story)
		# You must link the Doctor's brain with the Dalek's and get him to relive the moment he saw the creation of the star
		return tk_link.tell_joke()


class Victory(object):

	def enter(self, story_tag, action_tag):
		# Description of room scene
		story_tag.delete(1.0, END)
		Victory_story = """You tumble out of the Dalek...
...and find yourself back in the control room of the 'Aristotle.'

The Doctor stares intensely at the 'good' Dalek.
You can tell - He is disturbed...
The Dalek only saw darkness inside him.
You try to reassure him that it all worked out anyways.
'But it would have been  nice if we could have made a good Dalek...'

The good Dalek sends a signal to his mothership.
He tells the rest of the Dalek force:
'The 'Aristotle' has been destroyed.'

The rebels can now operate completely under the Dalek radar.
You leave them with a new soldier -- the good Dalek.

You hop on the Tardis and turn the key. A new adventure awaits... 

GAME OVER. YOU WIN. PLEASE PLAY AGAIN."""
		story_tag.insert(1.0, Victory_story)
		exit(1)

