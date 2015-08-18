from tkinter import *

def check_power(your_power, story_tag):
	"checks to see if you have loaded the gun with enough power"
	# you seal the crack
	story_tag.delete(1.0, END)
	if len(your_power) >= 10:
		zap_win = """Everything goes quiet. You look to the Doctor.
'It worked,' he says. 'It is sealed.'
...However, you know... something is very, very wrong...

By stopping the leak, you 'fixed' the Dalek.
He reverts to his old evil ways and contacts the main Dalek ship.
You only have a few moments before a large scale Dalek attack hits...
'Quick!' The Doctor yells. 'We must find his consciousness!'
'...we must discover what made him believe he was GOOD...'"""
		story_tag.insert(1.0, zap_win)
		# progress to the next room, the Consciousness link
		return 'consciousness_link'
	# you don't seal the crack in time
	elif len(your_power) < 10:
		zap_loss = """It's not enough! You need more power!
You must try again!
But you're too weak! You can't press the button!
You feel yourself fading away..."""
		story_tag.insert(1.0, zap_loss)
		# DIE
		return 'death'
	else:
		zap_again = "It's not enough! Try again! Press 's' to load and fire!"
		story_tag.insert(1.0, zap_again)

def seal_crack(story_tag, action_tag):
	"""You must seal the radiation leak"""
	# create the game directions
	zap_dirs = "Press 's' to power up the laser gun, then fire..."
	story_tag.delete(1.0, END)
	story_tag.insert(1.0, zap_dirs)

	# create the box to load and fire
	zap_frm = Frame(action_tag)
	zap_var = StringVar()
	zap_ent = Entry(zap_frm, textvariable=zap_var).pack(side=LEFT)
	zap_but = Button(zap_frm, text="Fire!", command=(lambda: check_power(zap_var.get(), story_tag))).pack(side=RIGHT)
	zap_frm.pack(side=TOP, expand=YES, fill=X)

	# game variable
	zap_power = 10
