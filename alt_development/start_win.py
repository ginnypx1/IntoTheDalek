from tkinter import *
from quitter import Quitter


class GameDisplay(Frame):
	"""Creates a main window in which to play the game"""
	def __init__(self, parent=None):
		Frame.__init__(self, parent)

		# create a top box to tell the story
		story = """Are you ready to travel... 
							INTO THE DALEK?"""
		story_box = Text(self, bd=2, height=10, width=50)
		story_box.insert(1.0, story)
		story_box.pack(side=TOP, expand=YES, fill=BOTH)

		# create an action box to hold the games
		action_box = Label(self, text='Action will go here', height=10, width=50)
		action_box.pack(side=TOP, expand=YES, fill=BOTH)
		
		# create play again and quit buttons
		quit_space = Frame(self)
		again_but = Button(quit_space, text='Play!').pack(side=LEFT)
		quit_but = Quitter(quit_space).pack(side=RIGHT)
		quit_space.pack(side=TOP, fill=X)


if __name__ == '__main__':
	root = Tk()
	root.title('Into the Dalek')
	gd = GameDisplay(root)
	gd.pack(side=TOP)
	root.mainloop()