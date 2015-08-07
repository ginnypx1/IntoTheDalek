from tkinter import *
from random import randint

from death import Death
from nuts_and_bolts import clear_window
from power_center import PowerCenter


class WasteCenter(object):
	"""Third scene of the game: inside the waste center"""
	def __init__(self):
		"creates game variables"
		self.moves = ['Rock', 'Paper', 'Scissors']
		self.dr_hand = self.moves[randint(0,2)]

	def enter(self, story_tag, action_tag):
		"starts the scene inside the waste center"
		# Description of room scene
		story_tag.delete(1.0, END)
		WasteCenter_story = """The waste center looks like the inside of a giant garbage dumpster.
While you clean off your shoes, the Doctor whips out his sonic screwdriver.
He takes some atmospheric readings.
He confirms -- this area is unguarded.
But something very nearby is emitting a very high degree of radiation.
You cannot stay inside this area for long...
		
You must leave. You must find the source of radiation.
But how can you camoflage yourself?
The Doctor suggests you rub just enough garbage on yourself...
"...to cover the smell." Yuck.
You don't want to.
		
The Doctor suggets you solve the impass with a game of RPS.
Rock Paper Scissors? He can't be serious.
He is."""
		story_tag.insert(1.0, WasteCenter_story)
		# starts a game of Rock Paper Scissors
		return self.rps(story_tag, action_tag)

	def rps(self, story_tag, action_tag):
		"You must play a game of Rock Paper Scissors"
		# display game directions
		rps_dirs = "1.. 2.. 3.. THROW!"
		rps_lbl = Label(action_tag, text=rps_dirs, height=2).pack(side=TOP)

		# create radio buttons to answer the question
		rps_var = StringVar()
		for key in self.moves:
			Radiobutton(action_tag, text=key, variable=rps_var, value=key).pack(side=TOP)
		rps_but = Button(action_tag, text='Throw!', command=(lambda: self.check_throw(rps_var.get(), story_tag, action_tag))).pack(side=TOP, fill=X)

	def check_throw(self, hand, story_tag, action_tag):
		"checks the results of a game of rock paper scissors"
		story_tag.delete(1.0, END)
		print(hand, self.dr_hand)
		# wins
		if self.dr_hand == 'Paper' and hand == 'Scissors' or self.dr_hand == 'Scissors' and hand == 'Rock' or self.dr_hand == 'Rock' and hand == 'Paper':
			rps_win = """{}, {}:
You win! No garbage for you.

Unfortunately, that means the second you walk out the door...
... you are attacked and killed.""".format(hand, self.dr_hand)
			story_tag.insert(1.0, rps_win)
			clear_window(action_tag)
			# DIE
			next_var = 'death'
			# creates a next button 
			next_but = Button(action_tag, text="Next", command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=LEFT, fill=X)
			return next_var
		# lose
		elif self.dr_hand == 'Rock' and hand == 'Scissors' or self.dr_hand == 'Paper' and hand == 'Rock' or self.dr_hand == 'Scissors' and hand == 'Paper':
			rps_loss = """{}, {}:
You lose! \nYou take a deep breath....
...And cover yourself in garbage.

You step outside. It works! The Dalek ignores you.
Now... You must follow the source of the radiation...
...and stop the leak in order to complete your quest.
You make a run for the Power Center.""".format(hand, self.dr_hand)
			story_tag.insert(1.0, rps_loss)
			clear_window(action_tag)
			# proceed to the next room, the Power Center
			next_var = 'power_center'
			# creates a next button 
			next_but = Button(action_tag, text="Next", command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=LEFT, fill=X)
			return next_var
		# draw
		elif self.dr_hand == 'Rock' and hand == 'Rock' or self.dr_hand == 'Paper' and hand == 'Paper' or self.dr_hand == 'Scissors' and hand == 'Scissors':
			rps_tie = "{}, {}: It's a draw. Go again.".format(hand, self.dr_hand)
			self.dr_hand = self.moves[randint(0,2)]
			story_tag.insert(1.0, rps_tie)
	
	def move_on(self, next_room, story_tag, action_tag):
		"moves the game into the next scene"
		if next_room == 'power_center':
			pc = PowerCenter()
			pc.enter(story_tag, action_tag)
		else:
			dt = Death()
			dt.enter(story_tag, action_tag)	

if __name__ == '__main__':
	root = Tk()
	root.title('Waste Center')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.pack(side=TOP, expand=YES, fill=BOTH)

	action_box = Frame(root, height=10, width=50)
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	wc = WasteCenter()
	wc.enter(story_box, action_box)

	root.mainloop()