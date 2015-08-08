from tkinter import *

from death import Death
from nuts_and_bolts import clear_window
from victory import Victory


class ConsciousnessLink(object):
	"""Creates the fifth scene for the text adventure game Into the Dalek"""
	def __init__(self):
		self.jokes = {"a": "Why do the Daleks eat apples?",
			"b": "How does a Dalek keep its skin soft?",
			"c": "Why did the Dalek cross the road?"}

	def enter(self, story_tag, action_tag):
		"starts the Consciousness Link scene of the game Into the Dalek"
		clear_window(action_tag)
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
		return self.tell_joke(story_tag, action_tag)

	def tell_joke(self, story_tag, action_tag):
		"You must tell a successful joke to link the Doctor and the Dalek"
		# create game directions
		joke_dirs = "Which joke do you decide to tell?"
		joke_lbl = Label(action_tag, text=joke_dirs).pack(side=TOP, fill=X)
		# create radio buttons to answer the question
		joke_var = StringVar()
		for key, value in self.jokes.items():
			Radiobutton(action_tag, text=value, variable=joke_var, value=key).pack(side=TOP, fill=X)
		joke_but = Button(action_tag, text="Go", command=(lambda: self.result_joke(joke_var.get(), story_tag, action_tag))).pack(side=TOP, fill=X)

	def result_joke(self, joke, story_tag, action_tag):
		"checks the results of the joke told"
		clear_window(action_tag)
		story_tag.delete(1.0, END)
		# Dalek laughs, Doctor doens't. Fail.
		if joke == 'a':
			joke_loss = """The Dalek starts to laugh.
'I know this one!' he says.
'An apple a day... Keeps the Doctor away!'
'HA HA HA HA HA!'

You look at the Doctor.
He isn't amused.
The link fails. The Daleks attack!"""
			story_tag.insert(1.0, joke_loss)
			# DIE
			next_var = 'death'
			# creates a next button 
			next_but = Button(action_tag, text="Next", command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=LEFT, fill=X)
			return next_var
		# Doctor laughs, Dalek doesn't. Fail.
		elif joke == 'b':
			joke_loss2 = """'I know this one!' the Doctor says.
'EXFOLIATE!'
The Doctor cracks up and smacks his knee.
'HA HA HA HA HA!'

You look around the inside of the Dalek.
You can both tell. He isn't amused.
The link fails. The Daleks attack!"""
			story_tag.insert(1.0, joke_loss2)
			# DIE
			next_var = 'death'
			# creates a next button 
			next_but = Button(action_tag, text="Next", command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=LEFT, fill=X)
			return next_var
		# Doctor and Dalek laugh. Link succeeds.
		elif joke == 'c':
			joke_win = """'To exterminate humanity!'
The Doctor and the Dalek yell at the same time.
'HA HA HA HA HA!'

The ship fills with laughter.
Then something wonderful happens.
All the images around you become the star being born.
It's beautiful. Mezmerizing. You are transported.
...And so are the Doctor and the Dalek.

The Dalek tears up.
'How could you destroy when creation is so wonderful?' he says.
He is good again."""
			story_tag.insert(1.0, joke_win)
			# win
			next_var = 'victory'
			# creates a next button 
			next_but = Button(action_tag, text="Next", command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=LEFT, fill=X)
			return next_var

	def move_on(self, next_room, story_tag, action_tag):
		"moves the game into the next scene"
		if next_room == 'victory':
			vt = Victory()
			vt.enter(story_tag, action_tag)
		else:
			dt = Death()
			dt.enter(story_tag, action_tag)	
	


if __name__ == '__main__':
	root = Tk()
	root.title('Consciousness Link')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.pack(side=TOP, expand=YES, fill=BOTH)

	action_box = Frame(root, height=10, width=50)
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	cl = ConsciousnessLink()
	cl.enter(story_box, action_box)

	root.mainloop()
