from tkinter import *


class LogicQuiz(Frame):
	"""You must solve a simple logic puzzle to discover the good Dalek"""
	def __init__(self, parent=None):
		Frame.__init__(self, parent)

		# create the game directions
		dirs = """The rebel officers step aside.
Two Daleks are wheeled into the center of the room.
One is the 'good' Dalek. The other is evil.
The officers will let you choose one Dalek...
But upon doing so you must release it from its chains.

You can ask one Dalek one question.
You assume, as is the case with all Daleks...
...that the real Dalek will only lie.
The good Dalek must only tell the truth.

What question do you ask?"""
		logic_dir = Text(self, width=70, height=12, wrap=WORD)
		logic_dir.insert(1.0, dirs)
		logic_dir.pack(side=TOP, expand=YES, fill=BOTH)

		# create the input box to answer question
		logic_var = StringVar()
		logic_ent = Entry(self, textvariable=logic_var)
		logic_ent.pack(side=TOP, fill=X)

		# create the button to check the answer
		logic_but = Button(self, text='Ask', command=(lambda: self.check_answer(logic_var.get(), logic_dir)))
		logic_but.pack(side=TOP, fill=X)

	# create the function to check the answer, finish the game	
	def check_answer(self, answer, dir_tag):
		answer.lower()
		dir_tag.delete(1.0, END)
		if "other" in answer:
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
			dir_tag.insert(1.0, solve_text)
			# proceed to the next room, the Cortex Vault
			return 'cortex_vault'
		else:
			miss_text = """You tell the guards to release the Dalek.
They unlock the chains.
You all hold your breath...
The Dalek opens fire..."""
			dir_tag.insert(1.0, miss_text)
			# play Death scene
			return 'death'


if __name__ == '__main__':
	root = Tk()
	root.title('Logic Game')
	lg = LogicQuiz(root)
	lg.pack(side=TOP)
	root.mainloop()