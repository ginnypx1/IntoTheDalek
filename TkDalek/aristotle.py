from tkinter import *

from cortex_vault import CortexVault
from death import Death
from nuts_and_bolts import clear_window, game_over


class Aristotle(object):
	"""First scene of the game: Inside the Aristotle"""
	def enter(self, story_tag, action_tag):
		"starts the scene in the Aristotle"
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
		options = ['Yes', 'No']
		choice = Label(action_tag, bg='orange', fg='navy')
		choice.config(text='Will you help confirm the existence of a GOOD Dalek?')
		choice.pack(side=TOP, fill=X, pady=5)
		# Creates the radiobuttons for yes or no
		entries = Frame(action_tag)
		entries.config(bg='orange')
		a_var = StringVar()
		for option in options:
			Radiobutton(action_tag, text=option, variable=a_var, value=option, bg='orange').pack(side=TOP)
		entries.pack(side=TOP, fill=X, pady=5)
		# creates the button for enter
		a_but = Button(action_tag, text='ENTER')
		a_but.config(command=(lambda: self.chooseToHelp(a_var.get(), story_tag, action_tag)))
		a_but.pack(side=TOP, fill=X)

	def chooseToHelp(self, action, story_tag, action_tag):
		"gives you a choice to act"
		clear_window(action_tag)
		if action == "No":
			no_text = "You are shoved back in your Tardis and released into space."
			story_tag.delete(1.0, END)
			story_tag.insert(1.0, no_text)
			game_over(action_tag)
		else:
			return self.logic_quiz(story_tag, action_tag)

	def logic_quiz(self, story_tag, action_tag):
		"you must solve a simple logic puzzle to discover the good Dalek"
		# clear the action box
		clear_window(action_tag)
		# create the game directions
		logic_dirs = """The rebel officers step aside.
Two Daleks are wheeled into the center of the room.
One is the 'good' Dalek. The other is evil.
The officers will let you choose one Dalek...
But upon doing so you must release it from its chains.

You can ask one Dalek one question.
You assume, as is the case with all Daleks...
...that the real Dalek will only lie.
The good Dalek must only tell the truth.

What question do you ask?"""
		story_tag.delete(1.0, END)
		story_tag.insert(1.0, logic_dirs)

		# create the input box to answer question
		logic_var = StringVar()
		logic_ent = Entry(action_tag, textvariable=logic_var)
		logic_ent.config(bg='orange', fg='navy')
		logic_ent.pack(side=TOP, fill=X)

		# create the button to check the answer
		logic_but = Button(action_tag, text='ASK')
		logic_but.config(command=(lambda: self.check_answer(logic_var.get(), story_tag, action_tag)))
		logic_but.pack(side=TOP, fill=X)

	def check_answer(self, answer, story_tag, action_tag):
		"checks the answer given to the logic question"
		# cleans and clears field
		answer.lower()
		story_tag.delete(1.0, END)
		clear_window(action_tag)
		# creates a next button
		next_but = Button(action_tag, text="NEXT", command=(lambda: self.move_on(next_var, story_tag, action_tag)))
		next_but.pack(side=TOP, fill=X)
		# process answer
		if "other" in answer:			
			# display win message
			solve_text = """You turn away from that Dalek and point to the other one.
You tell the guards to release him. They unlock the chains.
You all hold your breath...
The Dalek does not kill you.
It's a miracle. A good Dalek does exist.

The Doctor asks, 'Do you have a shrink ray on board?'
Journey Blue answers, 'Of course!'
The Doctor explains his plan: you'll use the shrink ray.
You will journey into the good Dalek's mind.
You wait patiently while the shrink ray warms up...
5... 4... 3... 2... 1..."""
			story_tag.insert(1.0, solve_text)
			# proceed to the next room, the Cortex Vault
			next_var = 'cortex_vault'
			return next_var
		else:
			miss_text = """You tell the guards to release the Dalek.
They unlock the chains.
You all hold your breath...
The Dalek opens fire..."""
			story_tag.insert(1.0, miss_text)
			# play Death scene
			next_var = 'death'
			return next_var

	def move_on(self, next_room, story_tag, action_tag):
		"moves the game into the next scene"
		if next_room == 'cortex_vault':
			cv = CortexVault()
			cv.enter(story_tag, action_tag)
		else:
			dt = Death()
			dt.enter(story_tag, action_tag)


if __name__ == '__main__':
	root = Tk()
	root.title('Aristotle')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.config(bg='navy', fg='gold')
	story_box.config(bd=2, relief=SUNKEN)
	story_box.pack(side=TOP, expand=YES, fill=BOTH, padx=10, pady=10)

	action_box = Frame(root, height=10, width=50)
	action_box.config(bg='orange')
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	at = Aristotle()
	at.enter(story_box, action_box)

	root.mainloop()
