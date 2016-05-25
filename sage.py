import sys
import math

test_cases = {17}

#######################################################################################################################

# Calculate and return the gcd(greatest common divisor) of two numbers x and y;
#
# Para: x, y the two numbers we calculate the gcd for.
#
# Return: the gcd of x and y.


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

#######################################################################################################################

# Naive method for finding all primitive roots of prime number n and return a set of them.
#
# Para: n the prime number which the set of primitive roots belong to.
# The caller is responsible for providing a prime number as the parameter,
# otherwise the behavior is unspecified.
#
# Return: set() the sorted set of all primitive roots of n
#
# Time complexity: O(n^2);
# Space complexity: O(n);


def find_primitive_roots(n):
    coprime = range(1, n)
    result = set()
    highest_exp = len(coprime)
    for num in coprime:
        each_set = set()
        for exp in range(1, highest_exp + 1):
            remainder = num ** exp % n
            each_set.add(remainder)
            if remainder == 1:
                break
        if len(each_set) == len(coprime):
            # print num, "is a primitive root of", n
            result.add(num)
    print ""
    return sorted(result)

#######################################################################################################################

# Advanced method for finding all primitive roots of prime number n and return a set of them.
#
# Para: n the prime number which the set of primitive roots belong to.
# The caller is responsible for providing a prime number as the parameter,
# otherwise the behavior is unspecified.
#
# Return: set() the sorted set of all primitive roots of n
#
# Time complexity: O(nlogn);
# Space complexity: O();


def find_primitive_roots_advanced(n):
    q = math.floor(math.sqrt(n))
    print q
    result = set()
    for a in range(n):
        set_x = set()
        set_y = set()
        for i in range(n):
            set_x.add((a ** i) % n)
            set_y.add((a ** (q * i)) % n)
        print set_x
        print set_y
        set_z = set_x.union(set_y)
        print set_z
        print
        if len(set_z) == len(set_x) + len(set_y):
            result.add(a)

    return sorted(result)


#######################################################################################################################

# Append spaces after the parameter number to make it align correctly.
#
# Para: number the number to add spaces after
# e.x. 6 spaces after 1-digit number; 5 spaces after 2-digit number; 4 spaces after 3-digit number;
def write_spaces(number):
    spaces = 5
    deno = 10
    while number >= deno:
        spaces -= 1
        deno *= 10
    for i in range(spaces):
        sys.stdout.write(" ")

#######################################################################################################################


def print_dlog(n):
    all_primitive_roots = find_primitive_roots(n)

    print "discrete log of", n, "is: "
    sys.stdout.write("exponent:                  ")

    # Write numbers from 1 to n - 1
    for i in range(1, n):
        sys.stdout.write(" " + str(i))
        write_spaces(i)
    print ""

    remainder_map_list = list()
    for each_root in all_primitive_roots:
        remainder_map = find_dlog_map(each_root, n)
        remainder_map_list.append(remainder_map)

    print_all_dlog_permutation(all_primitive_roots, remainder_map_list)
    all_dlog_list = find_all_dlog_list(remainder_map_list)

    # print_cycle_notation(all_dlog_list)

#######################################################################################################################


def print_all_dlog_permutation(all_primitive_roots, remainder_map_list):
    i = 0
    for each_root in all_primitive_roots:
        sys.stdout.write(str(each_root) + " as a primitive root:")
        write_spaces(each_root)

        for each_remainder in remainder_map_list[i]:
            sys.stdout.write(" " + str(remainder_map_list[i][each_remainder]))
            write_spaces(remainder_map_list[i][each_remainder])
        i += 1
        print ""

#######################################################################################################################


def find_all_dlog_list(remainder_map_list):
    all_dlog_list = list()
    for each_remainder_map in remainder_map_list:
        each_dlog_list = list()
        for each_remainder in each_remainder_map:
            each_dlog_list.append(each_remainder_map[each_remainder])
        all_dlog_list.append(each_dlog_list)
    return all_dlog_list

#######################################################################################################################


def print_cycle_notation(all_dlog_list, a, b):
    print "cycle notation of", a, "and", b, ":"
    for each_dlog_list in all_dlog_list:
        each_dlog_all_cycle = list()
        is_cycled = dict()
        for eachNum in each_dlog_list:
            is_cycled[eachNum] = 0
        for eachNum in each_dlog_list:
            start = eachNum
            each_dlog_each_cycle = list()
            while is_cycled[start] == 0:
                each_dlog_each_cycle.append(start)
                new_start = each_dlog_list[start - 1]
                is_cycled[start] = 1
                start = new_start
            each_dlog_all_cycle.append(each_dlog_each_cycle)
        for each_dlog_each_cycle in each_dlog_all_cycle:
            if len(each_dlog_each_cycle) != 0:
                sys.stdout.write("(")
                sys.stdout.write(str(each_dlog_each_cycle[0]))
                for i in range(1, len(each_dlog_each_cycle)):
                    sys.stdout.write("," + str(each_dlog_each_cycle[i]))
                sys.stdout.write(")")
                sys.stdout.write(" ")
        # append additionally one blank line at the end for each transition map request.
        print ""
        print ""

#######################################################################################################################


def find_dlog_map(each_root, n):
    remainder_map = dict()
    for i in range(1, n):
        each_dlog = each_root ** i % n
        remainder_map[each_dlog] = i
    return remainder_map

#######################################################################################################################


def find_transition_permutations_map(n, a, b):
    a_dlog_map = find_dlog_map(a, n)
    b_dlog_map = find_dlog_map(b, n)
    transition_map = dict()
    for key in a_dlog_map:
        each_a_dlog = a_dlog_map[key]
        each_b_dlog = b_dlog_map[key]
        transition_map[each_a_dlog] = each_b_dlog
    return transition_map

#######################################################################################################################


def print_transition_map(n, a, b):
    transition_permutations_map = find_transition_permutations_map(n, a, b)
    remainder_map_list = list()
    remainder_map_list.append(transition_permutations_map)
    all_dlog_list = find_all_dlog_list(remainder_map_list)
    print_cycle_notation(all_dlog_list, a, b)

#######################################################################################################################

for num in sorted(test_cases):
    print_dlog(num)
print ""

print "transition map:"
print_transition_map(19, 2, 10)
print_transition_map(19, 3, 14)
