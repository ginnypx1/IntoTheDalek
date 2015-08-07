from tkinter import *

def clear_window(action_tag):
	"clears the actions inside the action window"
	for widget in action_tag.winfo_children():
				widget.destroy()

def game_over(action_tag):
	game_over = "Extermination Successful. GAME OVER. The human race is dead."
	death_lab = Label(action_tag, text=game_over).pack(side=TOP, fill=X)
