from tkinter import *

from nuts_and_bolts import clear_window


class Victory(object):
	"""Final scene in the text adventure game Into the Dalek"""
	def enter(self, story_tag, action_tag):
		"displays the victory message for the text adventure game Into the Dalek"
		# Description of room scene
		story_tag.delete(1.0, END)
		Victory_story = """You tumble out of the Dalek...
...and find yourself back in the control room of the 'Aristotle.'

The Doctor stares intensely at the 'good' Dalek.
You can tell - He is disturbed...
The Dalek only saw darkness inside him.
You try to reassure him that it all worked out anyways.
'But it would have been  nice if we could have made a good Dalek...'

The good Dalek sends a signal to his mothership.
He tells the rest of the Dalek force:
'The 'Aristotle' has been destroyed.'

The rebels can now operate completely under the Dalek radar.
You leave them with a new soldier -- the good Dalek.

You hop on the Tardis and turn the key. A new adventure awaits... """
		story_tag.insert(1.0, Victory_story)
		# game over message in the action screen
		clear_window(action_tag)
		game_over = "GAME OVER. YOU WIN. PLEASE PLAY AGAIN."
		over_lab = Label(action_tag, text=game_over)
		over_lab.config(bg='orange', fg='navy')
		over_lab.pack(side=TOP, fill=X, pady=5)


if __name__ == '__main__':
	root = Tk()
	root.title('Victory')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.config(bg='navy', fg='gold')
	story_box.config(bd=2, relief=SUNKEN)
	story_box.pack(side=TOP, expand=YES, fill=BOTH, padx=10, pady=10)

	action_box = Frame(root, height=10, width=50)
	action_box.config(bg='orange')
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	vt = Victory()
	vt.enter(story_box, action_box)

	root.mainloop()
