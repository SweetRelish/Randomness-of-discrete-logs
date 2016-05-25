︠4771dee4-5664-478e-ada1-3a8d78d86cd9s︠
import sys

# increase output limit
sage_server.MAX_OUTPUT = 100000000
sage_server.MAX_OUTPUT_MESSAGES = 10000000

# determine set of primes computing for
primes = set()
for i in range(20,50):
    primes.add(Primes().unrank(i))

# test_cases = {17}

# calculate and return the gcd(greatest common divisor) of two numbers x and y;
# para: x, y the two numbers we calculate the gcd for.
# return the gcd of x and y.
def gcd(x, y):
    while x != 0 and y != 0:
        if x > y:
            x -= y
        else:
            y -= x
    if x > 0:
        return x
    else:
        return y

# find all primitive roots of number n and return a set of them.
# para: n the number which the set of primitive roots belong to
# return: set() the set of all primitive roots of n
def find_primitive_roots(n):
    coprime = set()
    result = set()
    for i in range(1, n):
        if gcd(i, n) == 1:
            coprime.add(i)
    highest_exp = len(coprime)
    for num in coprime:
        each_set = set()
        for exp in range(1, highest_exp + 1):
            remainder = num ** exp % n
            each_set.add(remainder)
            if remainder == 1:
                break
        if len(each_set) == len(coprime):
            result.add(num);
    print ""
    return result

def print_dlog(n):
    result = find_primitive_roots(n);
    for each_root in sorted(result):
        in_line = list()
        remainder_map = find_dlog_map(each_root, n)
        for each_remainder in remainder_map:
            in_line.append(remainder_map[each_remainder])
        print "Primitive Root:",each_root
        print "Cycle Notation "
        print Permutation(in_line).cycle_string(singletons=True)
        print "Cycle Lengths"
        print Permutation(in_line).cycle_type()
        print " "


def find_dlog_map(each_root, n):
    remainder_map = dict();
    for i in range(1, n - 1):
        each_dlog = each_root ** i % n
        remainder_map[each_dlog] = i;
    return remainder_map

for num in {17}:
    print "n=",num 
    print_dlog(num)
    print ""
    print ""
    print ""

︡73873414-3dc7-4965-88d9-3ed1ecd412c6︡{"stdout":"n= 17\n\nPrimitive Root: 3\nCycle Notation \n(1,14,6,11,13,9,3,12,4,5,15,8,2)(7,10)\nCycle Lengths\n[13, 2]\n \nPrimitive Root: 5\nCycle Notation \n(1,6,15,8,10,11,9,7,2,13,5,3,12,4)(14)\nCycle Lengths\n[14, 1]\n \nPrimitive Root: 6\nCycle Notation \n(1,2,15,8,14,10,9,13,7,6,5)(3,4,11)(12)\nCycle Lengths\n[11, 3, 1]\n \nPrimitive Root: 7\nCycle Notation \n(1,10,5,13,11,7,14,2,3,4,15,8,6)(9)(12)\nCycle Lengths\n[13, 1, 1]\n \nPrimitive Root: 10\nCycle Notation \n(1,10,13,3,4,7,14,2,11,15,8,6,9)(5)(12)\nCycle Lengths\n[13, 1, 1]\n \nPrimitive Root: 11\nCycle Notation \n(1,2,7,6,13,15,8,14,10)(3,4)(5,9)(11)(12)\nCycle Lengths\n[9, 2, 2, 1, 1]\n \nPrimitive Root: 12\nCycle Notation \n(1,6,7,2,5,11)(3,12,4,9,15,8,10)(13)(14)\nCycle Lengths\n[7, 6, 1, 1]\n \nPrimitive Root: 14\nCycle Notation \n(1,14,6,3,12,4,13)(2,9,11,5,7,10,15,8)\nCycle Lengths\n[8, 7]\n \n\n\n\n"}︡{"done":true}︡









