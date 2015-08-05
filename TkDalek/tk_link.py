from tkinter import *

def result_joke(joke, story_tag):
	"checks the results of the joke told"
	story_tag.delete(1.0, END)
	# Dalek laughs, Doctor doens't. Fail.
	if joke == 'a':
		joke_loss = """The Dalek starts to laugh.
'I know this one!' he says.
'An apple a day... Keeps the Doctor away!'
'HA HA HA HA HA!'

You look at the Doctor.
He isn't amused.
The link fails. The Daleks attack!"""
		story_tag.insert(1.0, joke_loss)
		# DIE
		return 'death'
	# Doctor laughs, Dalek doesn't. Fail.
	elif joke == 'b':
		joke_loss2 = """'I know this one!' the Doctor says.
'EXFOLIATE!'
The Doctor cracks up and smacks his knee.
'HA HA HA HA HA!'

You look around the inside of the Dalek.
You can both tell. He isn't amused.
The link fails. The Daleks attack!"""
		story_tag.insert(1.0, joke_loss2)
		# DIE
		return 'death'
	# Doctor and Dalek laugh. Link succeeds.
	elif joke == 'c':
		joke_win = """'To exterminate humanity!'
The Doctor and the Dalek yell at the same time.
'HA HA HA HA HA!'

The ship fills with laughter.
Then something wonderful happens.
All the images around you become the star being born.
It's beautiful. Mezmerizing. You are transported.
...And so are the Doctor and the Dalek.

The Dalek tears up.
'How could you destroy when creation is so wonderful?' he says.
He is good again."""
		story_tag.insert(1.0, joke_win)
		# DIE
		return 'victory'
	# not right input, run again.
	else:
		joke_again = """I know. They're not the best...
...but they're all we got."""
		story_tag.insert(1.0, joke_again)
		
def tell_joke(story_tag, action_tag):
	"""You must tell a successful joke to link the Doctor and the Dalek"""
	story_tag.delete(1.0, END)
	jokes = {"a": "Why do the Daleks eat apples?",
		"b": "How does a Dalek keep its skin soft?",
		"c": "Why did the Dalek cross the road?"}
	# create game directions
	joke_dirs = "Which joke do you decide to tell?"
	story_tag.insert(1.0, joke_dirs)

	# create radio buttons to answer the question
	joke_var = StringVar()
	for key, value in jokes.items():
		Radiobutton(action_tag, text=value, variable=joke_var, value=key).pack(side=TOP, fill=X)
	joke_but = Button(action_tag, text="Go", command=(lambda: result_joke(joke_var.get(), story_tag))).pack(side=TOP, fill=X)
