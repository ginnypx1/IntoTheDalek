def seal_crack():
	"""You must seal the radiation leak"""

	print("\n")
	print("You shoot by pressing s...")
	print("\n")

	crack_power = 10
	your_power = input('>  ').lower()

	# you seal the crack
	if len(your_power) >= 10:
		print("-"*20)
		print("Everything goes quiet. You look to the Doctor.")
		print("'It worked,' he says. 'It is sealed.'")
		print("...However, you know... something is very, very wrong...")
		print("\n")
		print("By stopping the leak, you 'fixed' the Dalek.")
		print("He reverts to his old evil ways and contacts the main Dalek ship.")
		print("You only have a few moments before a large scale Dalek attack hits...")
		print("'Quick!' The Doctor yells. 'We must find his consciousness!'")
		print("'...we must discover what made him believe he was GOOD...'")
		print("\n")
		# progress to the next room, the Consciousness link
		return 'consciousness_link'
	# you don't seal the crack in time
	elif len(your_power) < 10:
		print("-"*20)
		print("It's not enough! You need more power!")
		print("You must try again!")
		print("But you're too weak! You can't press the button!")
		print("You feel yourself fading away...")
		print("\n")
		# DIE
		return 'death'
	else:
		print("-"*20)
		print("Hurry! There's no time! Press 'S'!")
		print("\n")
		seal_crack()
