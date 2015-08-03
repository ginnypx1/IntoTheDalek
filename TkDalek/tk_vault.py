from tkinter import *
from random import randint


class CrackCode(Frame):
	"""You must crack a simple code to advance to the next part of the Dalek"""
	def __init__(self, parent=None):
		Frame.__init__(self, parent)
		self.code = "{}{}{}".format(randint(0,1), randint(0,1), randint(0,1))
		self.count = 0
		self.guessed_codes = []

		# create the game directions
		dirs = """There's a simple keypad lock on the Dalek's centeral vault.
'Good news!' The Doctor says. 'Only 3 digits...
...And the Daleks only know 1s and 0s.
'This should be fairly easy to crack...'
'But we only get 5 tries, before it shuts down for 24 hours.'"""
		code_dir = Text(self, width=70, height=12, wrap=WORD)
		code_dir.insert(1.0, dirs)
		code_dir.pack(side=TOP, expand=YES, fill=BOTH)

		# create the input box to enter a possible code and button to check answer
		code_frm = Frame(self)
		code_lbl = Label(code_frm, text='[KEYPAD=>]').pack(side=LEFT)
		code_var = IntVar()
		code_ent = Entry(code_frm, textvariable=code_var).pack(side=LEFT)
		code_but = Button(code_frm, text='Enter', command=(lambda: self.check_code(code_var.get(), code_dir))).pack(side=RIGHT)
		code_frm.pack(side=TOP, expand=YES, fill=BOTH)

	def counter(self):
		"keeps track of the number of guesses"
		self.count += 1
		return self.count

	def check_code(self, guess, dir_tag):
		"checks the entered code"
		# count the number of guesses
		self.guessed_codes.append(str(guess))
		total = self.counter()
		dir_tag.delete(1.0, END)
		# if guess == self.code:
		if guess == self.code:
			# display win state
			win_text = """POP! The Dalek vault opens.
Journey Blue steps forward and sticks her hand inside.
'Wrong move,' says the Doctor.
You watch as the Dalek unleashes an attack force...

It is a squadron of  super-fast autonomic antibodies.
They attack what is giving them pain...
They surround Journey Blue and they EXTERMINATE.
The Doctor shouts, 'We have to find somewhere unguareded! Run!'"""
			dir_tag.insert(1.0, win_text)
			# proceed to the next room
			return 'waste_center'
		elif total == 5:
			# display loss state
			loss_text = """Oh no. The Dalek vault shuts down....
Journey Blue gets out her grapple hook and shoots it.
'Wrong move,' says the Doctor.
You watch as the Dalek unleashes an attack force...
It is a squadron of  super-fast autonomic antibodies.

They attack what is giving them pain... 
They surround you all and they EXTERMINATE."""
			dir_tag.insert(1.0, loss_text)
			# DIE
			return 'death'
		else:
			miss_text = """BZZZZZZ. Incorrect. Try again. {} guess(es) remaining.

You've tried the codes: {}""".format((5 - total), self.guessed_codes)
			dir_tag.insert(1.0, miss_text)


if __name__ == '__main__':
	root = Tk()
	root.title('Crack the Code')
	cc = CrackCode(root)
	cc.pack(side=TOP)
	root.mainloop()