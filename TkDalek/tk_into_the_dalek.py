from tkinter import *

from aristotle import Aristotle
from nuts_and_bolts import clear_window
from quitter import Quitter


class GameDisplay(Frame):
	"""Creates a main window in which to play the game"""
	def __init__(self, parent=None):
		Frame.__init__(self, parent)

		# create a top box to tell the story
		story = """
	Are you ready to travel...


						INTO THE DALEK?"""
		story_box = Text(self, bd=2, height=20, width=80)
		story_box.insert(1.0, story)
		story_box.config(bg='navy', fg='gold')
		story_box.config(bd=2, relief=SUNKEN)
		story_box.pack(side=TOP, expand=YES, fill=BOTH, padx=10, pady=10)

		# create an action box to hold the games
		action_box = Frame(self, height=10, width=50)
		action_box.config(bg='orange')
		action_box.pack(side=TOP, expand=YES, fill=BOTH)

		# create play again and quit buttons
		quit_space = Frame(self)
		again_but = Button(quit_space, text='Play')
		again_but.config(command=(lambda: self.start_game(story_box, action_box)))
		again_but.pack(side=LEFT, padx=10, pady=10)
		quit_but = Quitter(quit_space).pack(side=RIGHT)
		quit_space.pack(side=TOP, fill=X)

	def start_game(self, story_tag, action_tag):
		"calls the first scene of the game"
		clear_window(action_tag)
		at = Aristotle()
		at.enter(story_tag, action_tag)


if __name__ == '__main__':
	root = Tk()
	root.title('Into the Dalek')
	gd = GameDisplay(root)
	gd.pack(side=TOP)
	root.mainloop()
