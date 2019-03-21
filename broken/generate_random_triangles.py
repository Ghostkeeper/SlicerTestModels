import random

size = 40
triangles = 100

indices = list(range(3 * triangles))
with open("random_triangles.obj", "w") as f:
	for i in indices:
		f.write("v {x} {y} {z}\n".format(x=random.uniform(0, size), y=random.uniform(0, size), z=random.uniform(0, size)))
	random.shuffle(indices)
	for a, b, c in zip(*[iter(indices)]*3):
		f.write("f {a} {b} {c}\n".format(a=a, b=b, c=c))
