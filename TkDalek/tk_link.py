def tell_joke():
	"""You must tell a successful joke to link the Doctor and the Dalek"""

	print("\n")
	print("Which joke do you decide to tell?")
	print("A) Why do the Daleks eat apples?")
	print("B) How does a Dalek keep its skin soft?")
	print("C) Why did the Dalek cross the road?")
	print("\n")

	joke = input(">  ").lower()

	# Dalek laughs, Doctor doens't. Fail.
	if joke == 'a':
		print("-"*20)
		print("The Dalek starts to laugh.")
		print("'I know this one!' he says.")
		print("'An apple a day... Keeps the Doctor away!'")
		print("'HA HA HA HA HA!'")
		print("\n")
		print("You look at the Doctor.")
		print("He isn't amused.")
		print("The link fails. The Daleks attack!")
		print("\n")
		# DIE
		return 'death'
	# Doctor laughs, Dalek doesn't. Fail.
	elif joke == 'b':
		print("-"*20)
		print("'I know this one!' the Doctor says.")
		print("'EXFOLIATE!'")
		print("The Doctor cracks up and smacks his knee.")
		print("'HA HA HA HA HA!'")
		print("\n")
		print("You look around the inside of the Dalek.")
		print("You can both tell. He isn't amused.")
		print("The link fails. The Daleks attack!")
		print("\n")
		# DIE
		return 'death'
	# Doctor and Dalek laugh. Link succeeds.
	elif joke == 'c':
		print("-"*20)
		print("'To exterminate humanity!'")
		print("The Doctor and the Dalek yell at the same time.")
		print("'HA HA HA HA HA!'")
		print("\n")
		print("The ship fills with laughter.")
		print("Then something wonderful happens.")
		print("All the images around you become the star being born.")
		print("It's beautiful. Mezmerizing. You are transported.")
		print("...And so are the Doctor and the Dalek.")
		print("\n")
		print("The Dalek tears up.")
		print("'How could you destroy when creation is so wonderful?' he says.")
		print("He is good again.")
		print("\n")
		# DIE
		return 'victory'
	# not right input, run again.
	else:
		print("-"*20)
		print("I know. They're not the best...")
		print("...but they're all we got.")
		print("Please type A, B or C.")
		print("\n")
		tell_joke()
