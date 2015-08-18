from tkinter import *
from random import randint

def check_throw(hand, story_tag):
	"checks the results of a game of rock paper scissors"
	story_tag.delete(1.0, END)
	# wins
	if dr_hand == 'paper' and hand == 'scissors' or dr_hand == 'scissors' and hand == 'rock' or dr_hand == 'rock' and hand == 'paper':
		rps_win = """You win! No garbage for you.

Unfortunately, that means the second you walk out the door...
... you are attacked and killed."""
		story_tag.insert(1.0, rps_win)
		# DIE
		return 'death'
	# lose
	elif dr_hand == 'rock' and hand == 'scissors' or dr_hand == 'paper' and hand == 'rock' or dr_hand == 'scissors' and hand == 'paper':
		rps_loss = """You lose! \nYou take a deep breath....
...And cover yourself in garbage.
"You step outside. It works! The Dalek ignores you.
Now... You must follow the source of the radiation...
...and stop the leak in order to complete your quest.
You make a run for the Power Center."""
		story_tag.insert(1.0, rps_loss)
		# proceed to the next room, the Power Center
		return 'power_center'
	# draw
	elif dr_hand == 'rock' and hand == 'rock' or dr_hand == 'paper' and hand == 'paper' or dr_hand == 'scissors' and hand == 'scissors':
		rps_tie = "It's a draw. Go again."
		story_tag.insert(1.0, rps_tie)
	else:
		rps_again = "Please enter rock, paper or scissors. Go again."
		story_tag.insert(1.0, rps_again)

def rps(story_tag, action_tag):
	"""You must play a game of Rock Paper Scissors"""
	# display game directions
	rps_dirs = "1.. 2.. 3.. THROW!"
	story_tag.delete(1.0, END)
	story_tag.insert(1.0, rps_dirs)

	# create radio buttons to answer the question
	rps_var = StringVar()
	for key in moves:
		Radiobutton(action_tag, text=key, variable=rps_var, value=key).pack(side=TOP, fill=X)
	rps_but = Button(action_tag, text='Throw!', command=(lambda: check_throw(rps_var.get(), story_tag))).pack(side=TOP, fill=X)

	# game variables
	moves = ['rock', 'paper', 'scissors']
	dr_hand = moves[randint(0,2)]


