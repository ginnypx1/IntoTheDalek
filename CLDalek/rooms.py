from random import randint
from sys import exit

import link
import logic_game
import rps
import vault
import zap


# TYPES OF SCENES
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
		"YOU ARE AN ENEMY OF THE DALEKS! YOU MUST BE DESTROYED!!"]

	def enter(self):
		# chooses a death quip at random from the above list of quips
		print(Death.quips[randint(0, len(self.quips)-1)])
		# tells us the game is over
		print("Extermination Successful. Game Over. The human race is dead.")
		print("\n")
		# exits game
		exit(1)


class Aristotle(object):
	def enter(self):
		# Description of room scene
		print("The Tardis flickers to life in the control room of the 'Aristotle'.")
		print("You open the door and shake yourself off, get your bearings.")
		print("You and the Doctor have just rescued the rebel fighter Journey Blue.")
		print("Her shuttle was under attack from the Daleks.")
		print("Your Tardis stumbled into the battle and you joined the fight.")
		print("Now you have returned her safely to her rebel base ship.")
		print("\n")
		print("You expect to enter to cheers, but instead, there is only silence....")
		print("You are surrounded. The rebel officers have been waiting for you.")
		print("They explain: They have captured a strange Dalek and they need your help.")
		print("This strange new Dalek appears to be... GOOD.")

		action = input("Will you help confirm the existence of a GOOD Dalek?  ").lower()

		if action == "no":
			print("You are shoved back in your Tardis and released into space.")
			print("\n")
			exit(1)
		elif action == "yes":
			return logic_game.logic_quiz()
		else:
			print("Yes or no. There is no other choice.")
			print("\n")
			return 'aristotle'


class CortexVault(object):
	def enter(self):
		# Description of room scene
		print("-"*20)
		print("You find yourself inside a metal hallway, black with red lights.")
		print("There are wires everywhere. You are inside a complicated machine.")
		print("The Doctor explains that this room forms the Dalek's cortex vault.")
		print("Dalek technology designed this vault to suppress any compassion...")
		print("...And also to store all of the Dalek's memories.")
		print("\n")

		# You try to break into the vault to directly link with the Dalek's processing
		return vault.crack_code()


class WasteCenter(object):
	def enter(self):
		# Description of room scene
		print("-"*20)
		print("The waste center looks like the inside of a giant garbage dumpster.")
		print("While you clean off your shoes, the Doctor whips out his sonic screwdriver")
		print("He takes some atmospheric readings.")
		print("He confirms -- this area is unguarded.")
		print("But something very nearby is emitting a very high degree of radiation.")
		print("You cannot stay inside this area for long...")
		print("\n")
		print("You must leave. You must find the source of radiation.")
		print("But how can you camoflage yourself?")
		print("The Doctor suggests you rub just enough garbage on yourself...")
		print("...to cover the smell. Yuck.")
		print("You don't want to.")
		print("\n")
		print("The Doctor suggets you solve the impass with a game of RPS.")
		print("Rock Paper Scissors? He can't be serious.")
		print("He is.")
		print("\n")

		# You must come up with a plan to camoflage yourself from the antibodies long enough to find the source of the radiation
		return rps.rps()
		

class PowerCenter(object):
	def enter(self):
		# Description of room scene
		print("-"*20)
		print("You find yourself inside what looks to be the guts of a central computer.")
		print("Wires, links and gauges are everywhere.")
		print("The Doctor swings his sonic screwdriver around...")
		print("'There!' He shouts, pointing to a large ray of light.")
		print("The radiation leak!'")
		print("\n")
		print("You must plug the leak so you can continue your quest.")
		print("The Doctor hands you his sonic screwdriver.")
		print("'You shoot while I twist the right wires!' he orders.")
		print("\n")

		# You must use the sonic screwdriver to stop the radiation leak
		return zap.seal_crack()


class ConsciousnessLink(object):
	def enter(self):
		# Description of room scene
		print("-"*20)
		print("You find yourself inside a giant dome.")
		print("Images, moving pictures, are all around you.")
		print("Most are horrific images of war, carnage, violence.")
		print("The Doctor explains that these are the Dalek's memories.")
		print("He urges you to look away. They will only destroy your soul.")
		print("\n")
		print("But you see one memory that is shockingly beautiful...")
		print("You move in closer....")
		print("\n")
		print("The Doctor explains that you're watching the creation of a star.")
		print("This could be it. This could be the memory you're looking for...")
		print("'I need to form a link to the Dalek brain...', the Doctor explains.")
		print("'I need him to think he is seeing this again for the first time.'")
		print("\n")
		print("The Doctor has an idea.")
		print("'Quick. Tell us a joke. If we both laugh...'")
		print("'...I may be able to sync up with his brain.'")
		print("\n")

		# You must link the Doctor's brain with the Dalek's and get him to relive the moment he saw the creation of the star
		return link.tell_joke()


class Victory(object):
	def enter(self):
		# Description of room scene
		print("-"*20)
		print("You tumble out of the Dalek...")
		print("...and find yourself back in the control room of the 'Aristotle.'")
		print("\n")
		print("The Doctor stares intensely at the 'good' Dalek.")
		print("You can tell - He is disturbed...")
		print("The Dalek only saw darkness inside him.")
		print("You try to reassure him that it all worked out anyways.")
		print("'But it would have been  nice if we could have made a good Dalek...'")
		print("\n")
		print("The good Dalek sends a signal to his mothership.")
		print("He tells the rest of the Dalek force:")
		print("'The 'Aristotle' has been destroyed.'")
		print("\n")
		print("The rebels can now operate completely under the Dalek radar.")
		print("You leave them with a new soldier -- the good Dalek.")
		print("\n")
		print("You hop on the Tardis and turn the key. A new adventure awaits... ")
		print("\nGAME OVER. YOU WIN. PLEASE PLAY AGAIN.")
		print("\n")
		exit(1)
