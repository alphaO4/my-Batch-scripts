import random

def binary():

    while True:

        r1 = str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1))
        r2 = str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1))
        r3 = str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1))
        r4 = str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1))
        r5 = str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1)) + str(random.randint(0,1))

        print("\t", int(r1), "\t", int(r2), "\t", int(r3), "\t", int(r4), "\t", int(r5))


binary()