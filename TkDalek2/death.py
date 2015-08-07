from tkinter import *
from random import randint

from nuts_and_bolts import clear_window

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
		# clears the screen
		story_tag.delete(1.0, END)
		clear_window(action_tag)
		# chooses a death quip at random from the above list of quips
		death_quip = Death.quips[randint(0, len(self.quips)-1)]
		story_tag.insert(1.0, death_quip)
		# tells us the game is over
		game_over = "Extermination Successful. GAME OVER. The human race is dead."
		death_lab = Label(action_tag, text=game_over).pack(side=TOP, fill=X)


if __name__ == '__main__':
	root = Tk()
	root.title('You are Dead')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.pack(side=TOP, expand=YES, fill=BOTH)

	action_box = Frame(root, height=10, width=50)
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	dt = Death()
	dt.enter(story_box, action_box)

	root.mainloop()