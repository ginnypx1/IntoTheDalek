from tkinter import *

from consciousness_link import ConsciousnessLink
from death import Death
from nuts_and_bolts import clear_window


class PowerCenter(object):
	"""Fourth scene of the game: inside the power center"""
	def __init__(self):
		"creates game variables"
		self.zap_power = 10

	def enter(self, story_tag, action_tag):
		"starts the scene inside the power center"
		# Description of room scene
		clear_window(action_tag)
		story_tag.delete(1.0, END)
		PowerCenter_story = """You find yourself inside what looks to be the guts of a central computer.
Wires, links and gauges are everywhere.
The Doctor swings his sonic screwdriver around...
'There!' He shouts, pointing to a large ray of light.
The radiation leak!'

You must plug the leak so you can continue your quest.
The Doctor hands you his sonic screwdriver.
'You shoot while I twist the right wires!' he orders."""
		story_tag.insert(1.0, PowerCenter_story)
		# You must use the sonic screwdriver to stop the radiation leak
		return self.seal_crack(story_tag, action_tag)

	def seal_crack(self, story_tag, action_tag):
		"You must seal the radiation leak"
		# create the game directions
		zap_dirs = "Press 's' to power up the laser gun, then fire..."
		zap_lbl = Label(action_tag, text=zap_dirs, height=2)
		zap_lbl.config(bg='orange', fg='navy')
		zap_lbl.pack(side=TOP)

		# create the box to load and fire
		zap_frm = Frame(action_tag, bg='orange')
		zap_var = StringVar()
		zap_ent = Entry(zap_frm, textvariable=zap_var, width=25)
		zap_ent.config(bg='navy', fg='orange')
		zap_ent.pack(side=TOP)
		zap_frm.pack(side=TOP, expand=YES, fill=X, pady=5)

		zap_but = Button(action_tag, text="FIRE")
		zap_but.config(command=(lambda: self.check_power(zap_var.get(), story_tag, action_tag)))
		zap_but.pack(side=TOP, fill=X)

	def check_power(self, your_power, story_tag, action_tag):
		"checks to see if you have loaded the gun with enough power"
		# you seal the crack
		story_tag.delete(1.0, END)
		if len(your_power) >= 10:
			clear_window(action_tag)
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
			next_var = 'consciousness_link'
			# creates a next button
			next_but = Button(action_tag, text="NEXT")
			next_but.config(command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=TOP, fill=X)
			return next_var
		# you don't seal the crack in time
		elif len(your_power) > 5 and len(your_power) < 10:
			clear_window(action_tag)
			zap_loss = """It's not enough! You need more power!
You must try again!

...But you're too weak! You can't press the button!
You feel yourself fading away..."""
			story_tag.insert(1.0, zap_loss)
			# DIE
			next_var = 'death'
			# creates a next button
			next_but = Button(action_tag, text="NEXT")
			next_but.config(command=(lambda: self.move_on(next_var, story_tag, action_tag)))
			next_but.pack(side=TOP, fill=X)
			return next_var
		else:
			story_tag.delete(1.0, END)
			zap_again = "It's not enough! Try again! Press 's' to load and fire!"
			story_tag.insert(1.0, zap_again)

	def move_on(self, next_room, story_tag, action_tag):
		"moves the game into the next scene"
		if next_room == 'consciousness_link':
			cl = ConsciousnessLink()
			cl.enter(story_tag, action_tag)
		else:
			dt = Death()
			dt.enter(story_tag, action_tag)


if __name__ == '__main__':
	root = Tk()
	root.title('Power Center')

	story_box = Text(root, bd=2, height=20, width=80)
	story_box.config(bg='navy', fg='gold')
	story_box.config(bd=2, relief=SUNKEN)
	story_box.pack(side=TOP, expand=YES, fill=BOTH, padx=10, pady=10)

	action_box = Frame(root, height=10, width=50)
	action_box.config(bg='orange')
	action_box.pack(side=TOP, expand=YES, fill=BOTH)

	pc = PowerCenter()
	pc.enter(story_box, action_box)

	root.mainloop()
