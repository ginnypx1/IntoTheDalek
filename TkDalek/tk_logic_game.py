from tkinter import *

# create the function to check the answer, finish the game	
def check_answer(answer):
	"checks the answer given to the logic question"
	answer.lower()
	story_tag.delete(1.0, END)
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
		return 'cortex_vault'
	else:
		miss_text = """You tell the guards to release the Dalek.
They unlock the chains.
You all hold your breath...
The Dalek opens fire..."""
		story_tag.insert(1.0, miss_text)
		# play Death scene
		return 'death'

def logic_quiz(story_tag, action_tag):
	"""You must solve a simple logic puzzle to discover the good Dalek"""
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
	logic_ent.pack(side=TOP, fill=X)

	# create the button to check the answer
	logic_but = Button(action_tag, text='Ask', command=(lambda: check_answer(logic_var.get())))
	logic_but.pack(side=TOP, fill=X)
					