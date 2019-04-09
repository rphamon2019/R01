import turtle as t
import math

size1 = 100
num_of_side = 4
size2 = math.sqrt(size1**2 + size1**2)
size3 = math.sqrt(size1**2 + size1**2)/2
angle1 = 90
angle2 = 45
angle3 = 135
color = 'blue'

t.color(color)
t.pensize(5)

t.left(angle1)
t.forward(size1)
t.right(angle1)
t.forward(size1)
t.right(angle3)
t.forward(size2)
t.left(angle3)
t.forward(size1)
t.left(angle3)
t.forward(size2)
t.right(angle1)
t.forward(size3)
t.right(angle1)
t.forward(size3)

t.right(angle2)
t.forward(size1)
t.done()