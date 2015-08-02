from random import randint

def rps():
	"""You must play a game of Rock Paper Scissors"""

	print("\n")
	print("1... 2... 3... THROW!")
	print("\n")

	moves = ['rock', 'paper', 'scissors']
	dr_hand = moves[randint(0,2)]

	hand = input('>  ')

	# wins
	if dr_hand == 'paper' and hand == 'scissors' or dr_hand == 'scissors' and hand == 'rock' or dr_hand == 'rock' and hand == 'paper':
		print("-"*20)
		print("You win! No garbage for you.")
		print("\n")
		print("Unfortunately, that means the second you walk out the door...")
		print("... you are attacked and killed.")
		print("\n")
		# DIE
		return 'death'
	# lose
	elif dr_hand == 'rock' and hand == 'scissors' or dr_hand == 'paper' and hand == 'rock' or dr_hand == 'scissors' and hand == 'paper':
		print("-"*20)
		print("You lose! \nYou take a deep breath....")
		print("...And cover yourself in garbage.")
		print("You step outside. It works! The Dalek ignores you.")
		print("Now... You must follow the source of the radiation...")
		print("...and stop the leak in order to complete your quest.")
		print("You make a run for the Power Center.")
		# proceed to the next room, the Power Center
		return 'power_center'
	# draw
	elif dr_hand == 'rock' and hand == 'rock' or dr_hand == 'paper' and hand == 'paper' or dr_hand == 'scissors' and hand == 'scissors':
		print("-"*20)
		print("It's a draw. Go again.")
		print("\n")
		rps()
	else:
		print("-"*20)
		print("Please enter rock, paper or scissors. Go again.")
		print("\n")
		rps()
