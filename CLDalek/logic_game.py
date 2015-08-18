def logic_quiz():
	"""You must solve a simple logic puzzle to discover the good Dalek"""

	print("The rebel officers step aside.")
	print("Two Daleks are wheeled into the center of the room.")
	print("One is the 'good' Dalek. The other is evil.")
	print("The officers will let you choose one Dalek...")
	print("But upon doing so you must release it from its chains.")
	print("\n")
	print("You can ask one Dalek one question.")
	print("You assume, as is the case with all Daleks...")
	print("...that the real Dalek will only lie.")
	print("The good Dalek must only tell the truth.")
	print("\n")

	question = input("What question do you ask? >  ").lower()

	if "other" in question:
		print("-"*20)
		print("You turn away from that Dalek and point to the other one.")
		print("You tell the guards to release him. They unlock the chains.")
		print("You all hold your breath...")
		print("The Dalek does not kill you.")
		print("It's a miracle. A good Dalek does exist.")
		print("\n")
		print("The Doctor asks, 'Do you have a shrink ray on board?'")
		print("Journey Blue answers, 'Of course!'")
		print("The Doctor explains his plan: you'll use the shrink ray.")
		print("You will journey into the good Dalek's mind.")
		print("You wait patiently while the shrink ray warms up...")
		print("5... 4... 3... 2... 1...")
		print("\n")
		# proceed to the next room, the Cortex Vault
		return 'cortex_vault'
	else:
		print("-"*20)
		print("You tell the guards to release the Dalek.")
		print("They unlock the chains.")
		print("You all hold your breath...")
		print("The Dalek opens fire...")
		print("\n")
		# play Death scene
		return 'death'
