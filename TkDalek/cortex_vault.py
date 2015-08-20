from tkinter import *
from random import randint

from death import Death
from nuts_and_bolts import clear_window
from waste_center import WasteCenter


class CortexVault(object):
	"""Creates the second scene of the game, in the cortex vault"""
	def __init__(self):
		"creates game variables"
		self.code = "{}{}{}".format(randint(0, 1), randint(0, 1), randint(0, 1))
		self.count = 0
		self.guessed_codes = []

	def enter(self, story_tag, action_tag):
		"starts the cortex vault scene"
		# Description of room scene
		story_tag.delete(1.0, END)
		CortexVault_story = """You find yourself inside a metal hallway, black with red lights.
There are wires everywhere. You are inside a complicated machine.
The Doctor explains that this room forms the Dalek's cortex vault.
Dalek technology designed this vault to suppress any compassion...
...And also to store all of the Dalek's memories."""
		story_tag.insert(1.0, CortexVault_story)
		# You try to break into the vault to directly link with the Dalek's processing
		return self.crack_code(story_tag, action_tag)

	def crack_code(self, story_tag, action_tag):
		"""You must crack a simple code to advance to the next part of the Dalek"""
		clear_window(action_tag)
		# create the game directions
		story_tag.delete(1.0, END)
		dirs = """There's a simple keypad lock on the Dalek's centeral vault.
'Good news!' The Doctor says. 'Only 3 digits...
...And the Daleks only know 1s and 0s.
'This should be fairly easy to crack...'
'But we only get 5 tries, before it shuts down for 24 hours.'"""
		story_tag.insert(1.0, dirs)

		# create the input box to enter a possible code and button to check answer
		code_info = Label(action_tag, bg='orange', fg='navy')
		code_info.pack(side=TOP, expand=YES, fill=X, pady=5)

		code_frm = Frame(action_tag, bg='orange')
		code_lbl = Label(code_frm, text='[KEYPAD=>]')
		code_lbl.config(bg='white', fg='navy')
		code_lbl.pack(side=LEFT, padx=120, pady=5)
		code_var = StringVar()
		code_ent = Entry(code_frm, textvariable=code_var)
		code_ent.config(bg='SkyBlue3', fg='white')
		code_ent.pack(side=LEFT, pady=5)
		code_frm.pack(side=TOP, expand=YES, fill=BOTH)

		code_but = Button(action_tag, text='ENTER CODE')
		code_but.config(command=(lambda: self.check_code(code_var.get(), code_info, story_tag, action_tag)))
		code_but.pack(side=TOP, fill=X)

	# game loop
	def check_code(self, guess, info_tag, story_tag, action_tag):
		"checks the entered code"
		# count the guesses
		self.count += 1
		self.guessed_codes.append(guess)
		print(self.code)
		# if guess == code:
		if guess == self.code:
			# clears action box
			clear_window(action_tag)
			# creates next button
			next_win_but = Button(action_tag, text="NEXT")
			next_win_but.config(command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_win_but.pack(side=TOP, fill=X)
			# display win state
			story_tag.delete(1.0, END)
			win_text = """POP! The Dalek vault opens.
Journey Blue steps forward and sticks her hand inside.
'Wrong move,' says the Doctor.
You watch as the Dalek unleashes an attack force...

It is a squadron of  super-fast autonomic antibodies.
They attack what is giving them pain...
They surround Journey Blue and they EXTERMINATE.
The Doctor shouts, 'We have to find somewhere unguareded! Run!'"""
			story_tag.insert(1.0, win_text)
			# proceed to the next room
			next_var = 'waste_center'
			return next_var
		# if there are 5 strikes:
		elif self.count == 5:
			# clears action box
			clear_window(action_tag)
			# creates next button
			next_loss_but = Button(action_tag, text="NEXT")
			next_loss_but.config(command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_loss_but.pack(side=TOP, fill=X)
			# display loss state
			story_tag.delete(1.0, END)
			loss_text = """Oh no. The Dalek vault shuts down....
Journey Blue gets out her grapple hook and shoots it.
'Wrong move,' says the Doctor.
You watch as the Dalek unleashes an attack force...
It is a squadron of  super-fast autonomic antibodies.

They attack what is giving them pain... 
They surround you all and they EXTERMINATE."""
			story_tag.insert(1.0, loss_text)
			# DIE
			next_var = 'death'
			return next_var
		# or ask for another entry
		else:
			miss_text = """BZZZZZZ. Incorrect. Try again. {} guess(es) remaining.

You've tried the codes: {}""".format((5 - self.count), self.guessed_codes)
			info_tag.config(text=miss_text)

	def move_on(self, next_room, story_tag, action_tag):
		"moves the game to the next scene, the waste center"
		if next_room == 'waste_center':
			wc = WasteCenter()
			wc.enter(story_tag, action_tag)
		else:
			dt = Death()
			dt.enter(story_tag, action_tag)


if __name__ == '__main__':
	root = Tk()
	root.title('Crack the code')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.config(bg='navy', fg='gold')
	story_box.config(bd=2, relief=SUNKEN)
	story_box.pack(side=TOP, expand=YES, fill=BOTH, padx=10, pady=10)

	action_box = Frame(root, height=10, width=50)
	action_box.config(bg='orange')
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	cv = CortexVault()
	cv.enter(story_box, action_box)

	root.mainloop()
