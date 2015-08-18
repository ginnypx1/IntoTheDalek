from tkinter import *
from random import randint

# game loop	
def check_code(guess, info_tag, story_tag):
	"checks the entered code"
	while guess != code and count < 5:
		# count the number of guesses
		count += 1
		guessed_codes.append(guess)
		info_tag.delete(1.0, END)
		# if guess == self.code:
		if guess == code:
			# display win state
			story_tag.delete(1.0, END)
			win_text = """POP! The Dalek vault opens.
Journey Blue steps forward and sticks her hand inside.
'Wrong move,' says the Doctor.
You watch as the Dalek unleashes an attack force...

It is a squadron of  super-fast autonomic antibodies.
They attack what is giving them pain...
They surround Journey Blue and they EXTERMINATE.
The Doctor shouts, 'We have to find somewhere unguareded! Run!'"""
			story_tag.insert(1.0, win_text)
			# proceed to the next room
			return 'waste_center'
			break
		elif count == 5:
			# display loss state
			story_tag.delete(1.0, END)
			loss_text = """Oh no. The Dalek vault shuts down....
Journey Blue gets out her grapple hook and shoots it.
'Wrong move,' says the Doctor.
You watch as the Dalek unleashes an attack force...
It is a squadron of  super-fast autonomic antibodies.

They attack what is giving them pain... 
They surround you all and they EXTERMINATE."""
			story_tag.insert(1.0, loss_text)
			# DIE
			return 'death'
			break
		else:
			miss_text = """BZZZZZZ. Incorrect. Try again. {} guess(es) remaining.

You've tried the codes: {}""".format((5 - count), guessed_codes)
			info_tag.insert(1.0, miss_text)
			
def crack_code(story_tag, action_tag):
	"""You must crack a simple code to advance to the next part of the Dalek"""
	# create the game directions
	story_tag.delete(1.0, END)
	dirs = """There's a simple keypad lock on the Dalek's centeral vault.
'Good news!' The Doctor says. 'Only 3 digits...
...And the Daleks only know 1s and 0s.
'This should be fairly easy to crack...'
'But we only get 5 tries, before it shuts down for 24 hours.'"""
	story_tag.insert(1.0, dirs)

	# create the input box to enter a possible code and button to check answer
	code_info = Label(action_tag)
	code_info.pack(side=TOP, expand=YES, fill=X)

	code_frm = Frame(action_tag)
	code_lbl = Label(code_frm, text='[KEYPAD=>]').pack(side=LEFT)
	code_var = StringVar()
	code_ent = Entry(code_frm, textvariable=code_var).pack(side=LEFT)
	code_but = Button(code_frm, text='Enter', command=(lambda: check_code(code_var.get(), code_info, story_tag))).pack(side=RIGHT)
	code_frm.pack(side=TOP, expand=YES, fill=BOTH)

	# game variables
	code = "{}{}{}".format(randint(0,1), randint(0,1), randint(0,1))
	count = 0
	guessed_codes = []
