︠2cf83f55-e8b7-451a-825e-d4efb1681c82s︠
import sys
from sage.plot.scatter_plot import ScatterPlot

# increase output limit
sage_server.MAX_OUTPUT = 100000000
sage_server.MAX_OUTPUT_MESSAGES = 10000000

#choose k cycle length to look for
k = 3

# determine set of primes computing for
primes_plot = list()
primes = set()
for i in range(1,100):
    primes.add(Primes().unrank(i))

test_cases = primes

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

k_plot = list()

def print_dlog(n):
    result = find_primitive_roots(n);
    k_cycles = 0
    for each_root in sorted(result):
        in_line = list()
        remainder_map = find_dlog_map(each_root, n)
        for each_remainder in remainder_map:
            in_line.append(remainder_map[each_remainder])
        for each_index in Permutation(in_line).cycle_type():
            if each_index == k:
                k_cycles = k_cycles + 1
        #print "Cycle Lengths:",Permutation(in_line).cycle_type()
    k_plot.append((k_cycles+0.0)/len(result)-1.0/k)
    print "Expected Number of %d-Cycles:" %k,(k_cycles+0.0)/len(result)
        
def find_dlog_map(each_root, n):
    remainder_map = dict();
    for i in range(1, n - 1):
        each_dlog = each_root ** i % n
        remainder_map[each_dlog] = i;
    return remainder_map

for num in sorted(test_cases):
    print "n =",num
    print_dlog(num)
    primes_plot.append(num)
    print "\n"*3
    
data = zip(primes_plot,k_plot)
#show(data)
show(points(data),title="Difference Between Dlog and Random Permutations for Expected Number of %d-Cycles" %k)

︡559d0c73-b83c-4da7-a4e1-0768f753c72e︡{"stdout":"n = 3\n\nExpected Number of 3-Cycles: 0.000000000000000\n\n\n\n\nn = 5\n\nExpected Number of 3-Cycles: 0.500000000000000\n\n\n\n\nn = 7\n\nExpected Number of 3-Cycles: 1.00000000000000\n\n\n\n\nn = 11\n\nExpected Number of 3-Cycles: 0.750000000000000\n\n\n\n\nn = 13\n\nExpected Number of 3-Cycles: 0.750000000000000\n\n\n\n\nn = 17\n\nExpected Number of 3-Cycles: 0.125000000000000\n\n\n\n\nn = 19\n\nExpected Number of 3-Cycles: 0.666666666666667\n\n\n\n\nn = 23\n\nExpected Number of 3-Cycles: 0.700000000000000\n\n\n\n\nn = 29\n\nExpected Number of 3-Cycles: 0.416666666666667\n\n\n\n\nn = 31\n\nExpected Number of 3-Cycles: 0.125000000000000\n\n\n\n\nn = 37\n\nExpected Number of 3-Cycles: 0.500000000000000\n\n\n\n\nn = 41\n\nExpected Number of 3-Cycles: 0.250000000000000\n\n\n\n\nn = 43\n\nExpected Number of 3-Cycles: 0.0833333333333333\n\n\n\n\nn = 47\n\nExpected Number of 3-Cycles: 0.409090909090909\n\n\n\n\nn = 53\n\nExpected Number of 3-Cycles: 0.458333333333333\n\n\n\n\nn = 59\n\nExpected Number of 3-Cycles: 0.428571428571429\n\n\n\n\nn = 61\n\nExpected Number of 3-Cycles: 0.500000000000000\n\n\n\n\nn = 67\n\nExpected Number of 3-Cycles: 0.400000000000000\n\n\n\n\nn = 71\n\nExpected Number of 3-Cycles: 0.416666666666667\n\n\n\n\nn = 73\n\nExpected Number of 3-Cycles: 0.291666666666667\n\n\n\n\nn = 79\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.625000000000000\n\n\n\n\nn = 83\n\nExpected Number of 3-Cycles: 0.450000000000000\n\n\n\n\nn = 89\n\nExpected Number of 3-Cycles: 0.275000000000000\n\n\n\n\nn = 97\n\nExpected Number of 3-Cycles: 0.406250000000000\n\n\n\n\nn = 101\n\nExpected Number of 3-Cycles: 0.325000000000000\n\n\n\n\nn = 103\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.625000000000000\n\n\n\n\nn = 107\n\nExpected Number of 3-Cycles: 0.307692307692308\n\n\n\n\nn = 109\n\nExpected Number of 3-Cycles: 0.305555555555556\n\n\n\n\nn = 113\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.291666666666667\n\n\n\n\nn = 127\n\nExpected Number of 3-Cycles: 0.388888888888889\n\n\n\n\nn = 131\n\nExpected Number of 3-Cycles: 0.500000000000000\n\n\n\n\nn = 137\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.265625000000000\n\n\n\n\nn = 139\n\nExpected Number of 3-Cycles: 0.477272727272727\n\n\n\n\nn = 149\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.347222222222222\n\n\n\n\nn = 151\n\nExpected Number of 3-Cycles: 0.350000000000000\n\n\n\n\nn = 157\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.208333333333333\n\n\n\n\nn = 163\n\nExpected Number of 3-Cycles: 0.388888888888889\n\n\n\n\nn = 167\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.243902439024390\n\n\n\n\nn = 173\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.297619047619048\n\n\n\n\nn = 179\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.295454545454545\n\n\n\n\nn = 181\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.354166666666667\n\n\n\n\nn = 191\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.319444444444444\n\n\n\n\nn = 193\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.281250000000000\n\n\n\n\nn = 197\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.345238095238095\n\n\n\n\nn = 199\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.316666666666667\n\n\n\n\nn = 211\n\nExpected Number of 3-Cycles: 0.416666666666667\n\n\n\n\nn = 223\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.180555555555556\n\n\n\n\nn = 227\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.366071428571429\n\n\n\n\nn = 229\n\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.263888888888889\n\n\n\n\nn = 233\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.285714285714286\n\n\n\n\nn = 239\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.322916666666667\n\n\n\n\nn = 241\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.312500000000000\n\n\n\n\nn = 251\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.420000000000000\n\n\n\n\nn = 257\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.304687500000000\n\n\n\n\nn = 263\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.353846153846154\n\n\n\n\nn = 269\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.340909090909091\n\n\n\n\nn = 271\n"}︡{"stdout":"\nExpected Number of 3-Cycles: 0.361111111111111\n\n\n\n\nn = 277\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.227272727272727\n\n\n\n\nn = 281\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.260416666666667\n\n\n\n\nn = 283\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.391304347826087\n\n\n\n\nn = 293\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.354166666666667\n\n\n\n\nn = 307\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.333333333333333\n\n\n\n\nn = 311\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.291666666666667\n\n\n\n\nn = 313\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.333333333333333\n\n\n\n\nn = 317\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.326923076923077\n\n\n\n\nn = 331\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.425000000000000\n\n\n\n\nn = 337\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.270833333333333\n\n\n\n\nn = 347\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.383720930232558\n\n\n\n\nn = 349\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.339285714285714\n\n\n\n\nn = 353\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.337500000000000\n\n\n\n\nn = 359\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.348314606741573\n\n\n\n\nn = 367\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.350000000000000\n\n\n\n\nn = 373\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.391666666666667\n\n\n\n\nn = 379\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.398148148148148\n\n\n\n\nn = 383\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.378947368421053\n\n\n\n\nn = 389\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.307291666666667\n\n\n\n\nn = 397\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.366666666666667\n\n\n\n\nn = 401\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.250000000000000\n\n\n\n\nn = 409\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.335937500000000\n\n\n\n\nn = 419\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.344444444444444\n\n\n\n\nn = 421\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.416666666666667\n\n\n\n\nn = 431\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.261904761904762\n\n\n\n\nn = 433\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.326388888888889\n\n\n\n\nn = 439\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.409722222222222\n\n\n\n\nn = 443\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.343750000000000\n\n\n\n\nn = 449\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.354166666666667\n\n\n\n\nn = 457\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.368055555555556\n\n\n\n\nn = 461\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.340909090909091\n\n\n\n\nn = 463\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.341666666666667\n\n\n\n\nn = 467\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.323275862068966\n\n\n\n\nn = 479\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.336134453781513\n\n\n\n\nn = 487\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.425925925925926\n\n\n\n\nn = 491\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.440476190476190\n\n\n\n\nn = 499\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.256097560975610\n\n\n\n\nn = 503\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.296000000000000\n\n\n\n\nn = 509\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.309523809523810\n\n\n\n\nn = 521\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.375000000000000\n\n\n\n\nn = 523\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.285714285714286\n\n\n\n\nn = 541\n"}︡{"stdout":"\nExpected Number of 3-Cycles:"}︡{"stdout":" 0.298611111111111\n\n\n\n\n"}︡{"file":{"filename":"/projects/582c664b-4df5-42c3-ac04-032673a1630c/.sage/temp/compute6-us/10585/tmp_1mN_sm.svg","show":true,"text":null,"uuid":"6e9e875c-0a99-43c3-b98d-008ebf71560e"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠a382f736-bfde-42ed-baa4-2916ad244112︠









