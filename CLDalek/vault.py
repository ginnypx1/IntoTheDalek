from random import randint


def crack_code():
	"""You must crack a simple code to advance to the next part of the Dalek"""

	print("\n")
	print("There's a simple keypad lock on the Dalek's centeral vault.")
	print("'Good news!' The Doctor says. 'Only 3 digits...")
	print("...And the Daleks only know 1s and 0s.")
	print("'This should be fairly easy to crack...'")
	print("'But we only get 5 tries, before it shuts down for 24 hours.'")
	print("\n")

	code = "{}{}{}".format(randint(0, 1), randint(0, 1), randint(0, 1))
	guess = 222
	guesses = 0

	while guess != code and guesses < 5:
		
		guesses += 1
		guess = input("[keypad]>  ")
				
		if guess == code:
			print("-"*20)
			print("POP! The Dalek vault opens.")
			print("Journey Blue steps forward and sticks her hand inside.")
			print("'Wrong move,' says the Doctor.")
			print("You watch as the Dalek unleashes an attack force...")
			print("\n")
			print("It is a squadron of  super-fast autonomic antibodies.")
			print("They attack what is giving them pain...")
			print("They surround Journey Blue and they EXTERMINATE.")
			print("The Doctor shouts, 'We have to find somewhere unguareded! Run!'")
			print("\n")
			# proceed to the next room
			return 'waste_center'	
		else:
			print("BZZZZZZ. Incorrect. Try again. {} guess(es) remaining.".format(5 - int(guesses)))

	if guess != code and guesses == 5:
		print("-"*20)
		print("Oh no. The Dalek vault shuts down....")
		print("Journey Blue gets out her grapple hook and shoots it.")
		print("'Wrong move,' says the Doctor.")
		print("You watch as the Dalek unleashes an attack force...")
		print("It is a squadron of  super-fast autonomic antibodies.")
		print("\n")
		print("They attack what is giving them pain...") 
		print("They surround you all and they EXTERMINATE.")
		print("\n")
		# DIE
		return 'death'
