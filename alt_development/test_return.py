from tkinter import *


root = Tk()


def play(number, lab_tag):
	if number == 0:
		lab_tag.config(text='you win!')
		print('win_state')
	elif number == 1:
		lab_tag.config(text='try again')
	else:
		lab_tag.config(text='you lose!')
		print('loss state')


def test():
	lab = Label(root, text='Tester')
	lab.pack(side=TOP)

	frm = Frame(root)
	var = IntVar()
	ent = Entry(frm, textvariable=var).pack(side=LEFT)
	but = Button(frm, text='Check', command=(lambda: play(var.get(), lab))).pack(side=RIGHT)
	frm.pack(side=TOP)

test()
root.mainloop()